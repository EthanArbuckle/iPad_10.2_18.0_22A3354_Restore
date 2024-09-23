@implementation BKWebViewProxy

- (void)setFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  id v8;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[BKWebViewProxy setLocalFrame:](self, "setLocalFrame:");
  v8 = (id)objc_claimAutoreleasedReturnValue(-[BKWebViewProxy loader](self, "loader"));
  objc_msgSend(v8, "setDesiredWebViewFrame:", x, y, width, height);

}

- (CGRect)frame
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  -[BKWebViewProxy localFrame](self, "localFrame");
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (unint64_t)pageCount
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKWebViewProxy loader](self, "loader"));
  v3 = objc_msgSend(v2, "pageCount");

  return (unint64_t)v3;
}

- (void)setClipsToBounds:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  id v5;

  v3 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[BKWebViewProxy loader](self, "loader"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "webView"));
  objc_msgSend(v4, "setClipsToBounds:", v3);

}

- (void)setScrollViewClipsToBounds:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  void *v5;
  id v6;

  v3 = a3;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[BKWebViewProxy loader](self, "loader"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "webView"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "scrollView"));
  objc_msgSend(v5, "setClipsToBounds:", v3);

}

- (void)clientRectsForLocations:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];

  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init((Class)NSMutableArray);
  v9 = objc_alloc_init((Class)NSMutableArray);
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v10 = v6;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v26;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v26 != v13)
          objc_enumerationMutation(v10);
        v15 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * (_QWORD)v14);
        objc_opt_class(BKEpubCFILocation);
        v17 = BUDynamicCast(v16, v15);
        v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
        if (v18)
          objc_msgSend(v9, "addObject:", v18);

        v14 = (char *)v14 + 1;
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v12);
  }

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[BKWebViewProxy loader](self, "loader"));
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_84E98;
  v22[3] = &unk_1C0558;
  v23 = v8;
  v24 = v7;
  v20 = v8;
  v21 = v7;
  objc_msgSend(v19, "clientRectsForLocations:completion:", v9, v22);

}

- (void)clientRectsForLocation:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  id v12;
  uint8_t v13[8];
  _QWORD v14[4];
  id v15;
  id v16;

  v6 = a3;
  v7 = a4;
  if (v6)
  {
    v16 = v6;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v16, 1));
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_8507C;
    v14[3] = &unk_1C0C28;
    v15 = v7;
    -[BKWebViewProxy clientRectsForLocations:completion:](self, "clientRectsForLocations:completion:", v8, v14);

    v9 = v15;
  }
  else
  {
    v10 = _AEWKProxyLog();
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v13 = 0;
      _os_log_impl(&dword_0, v11, OS_LOG_TYPE_ERROR, "clientRectsForLocation: nil location", v13, 2u);
    }

    v12 = objc_retainBlock(v7);
    v9 = v12;
    if (v12)
      (*((void (**)(id, _QWORD, _QWORD, _QWORD))v12 + 2))(v12, 0, 0, 0);
  }

}

- (CGRect)contentRectForVisibleContent
{
  void *v3;
  double v4;
  CGFloat x;
  double v6;
  CGFloat y;
  double v8;
  CGFloat width;
  double v10;
  CGFloat height;
  double v12;
  double v13;
  double v14;
  double v15;
  CGRect result;

  if (-[BKWebViewProxy hasWKWebView](self, "hasWKWebView"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKWebViewProxy loader](self, "loader"));
    objc_msgSend(v3, "contentRectForVisibleContent");
    x = v4;
    y = v6;
    width = v8;
    height = v10;

  }
  else
  {
    x = CGRectZero.origin.x;
    y = CGRectZero.origin.y;
    width = CGRectZero.size.width;
    height = CGRectZero.size.height;
  }
  v12 = x;
  v13 = y;
  v14 = width;
  v15 = height;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (CGRect)rectForPageOffset:(unint64_t)a3
{
  void *v5;
  double v6;
  CGFloat x;
  double v8;
  CGFloat y;
  double v10;
  CGFloat width;
  double v12;
  CGFloat height;
  double v14;
  double v15;
  double v16;
  double v17;
  CGRect result;

  if (-[BKWebViewProxy hasWKWebView](self, "hasWKWebView"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKWebViewProxy loader](self, "loader"));
    objc_msgSend(v5, "rectForPageOffset:", a3);
    x = v6;
    y = v8;
    width = v10;
    height = v12;

  }
  else
  {
    x = CGRectZero.origin.x;
    y = CGRectZero.origin.y;
    width = CGRectZero.size.width;
    height = CGRectZero.size.height;
  }
  v14 = x;
  v15 = y;
  v16 = width;
  v17 = height;
  result.size.height = v17;
  result.size.width = v16;
  result.origin.y = v15;
  result.origin.x = v14;
  return result;
}

- (id)currentLocationForOrdinal:(unint64_t)a3 pageOffset:(unint64_t)a4 contentInsets:(UIEdgeInsets)a5
{
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKWebViewProxy loader](self, "loader", a3, a4, a5.top, a5.left, a5.bottom, a5.right));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "currentFirstVisbleCFILocation"));

  objc_msgSend(v7, "setWk1EpubLocation:", 0);
  if (-[BKWebViewProxy hasWKWebView](self, "hasWKWebView"))
    v8 = v7;
  else
    v8 = 0;
  v9 = v8;

  return v9;
}

- (unint64_t)pageOffsetForLocation:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  Class v7;
  NSString *v8;
  void *v9;
  id v10;
  NSObject *v11;
  id v12;
  NSObject *v13;
  Class v14;
  NSString *v15;
  void *v16;
  int v18;
  void *v19;

  v4 = a3;
  if (-[BKWebViewProxy hasWKWebView](self, "hasWKWebView"))
  {
    v5 = _AEWKProxyLog();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      objc_opt_class(v4);
      v8 = NSStringFromClass(v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
      v18 = 138412290;
      v19 = v9;

    }
  }

  -[BKWebViewProxy hasWKWebView](self, "hasWKWebView");
  if (-[BKWebViewProxy hasWKWebView](self, "hasWKWebView"))
  {
    v10 = _AEWKProxyLog();
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v18) = 0;
      _os_log_impl(&dword_0, v11, OS_LOG_TYPE_ERROR, "Unable to determine current page offset.", (uint8_t *)&v18, 2u);
    }

    v12 = _AERePaginationLog();
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      objc_opt_class(v4);
      v15 = NSStringFromClass(v14);
      v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
      v18 = 138412290;
      v19 = v16;
      _os_log_impl(&dword_0, v13, OS_LOG_TYPE_DEFAULT, "BKEPubCVC - pageOffsetForLocation: No Page Offset Found for location of type (%@)!", (uint8_t *)&v18, 0xCu);

    }
  }
  -[BKWebViewProxy hasWKWebView](self, "hasWKWebView");

  return 0x7FFFFFFFFFFFFFFFLL;
}

- (double)scrollingPageWidthForPaginationMode:(unint64_t)a3 configuration:(id)a4
{
  id v6;
  void *v7;
  double v8;
  double Width;
  void *v10;
  CGRect v12;

  v6 = a4;
  v7 = v6;
  if ((a3 & 0xFFFFFFFFFFFFFFFELL) == 2)
  {
    objc_msgSend(v6, "contentLayoutSize");
    Width = v8;
  }
  else
  {
    Width = 0.0;
    if (-[BKWebViewProxy hasWKWebView](self, "hasWKWebView"))
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKWebViewProxy loader](self, "loader"));
      objc_msgSend(v10, "desiredWebViewFrame");
      Width = CGRectGetWidth(v12);

    }
  }

  return Width;
}

- (double)scrollingPageHeightForPaginationMode:(unint64_t)a3 configuration:(id)a4
{
  id v6;
  void *v7;
  double v8;
  double Height;
  void *v10;
  CGRect v12;

  v6 = a4;
  v7 = v6;
  if (a3 == 4)
  {
    objc_msgSend(v6, "contentLayoutSize");
    Height = v8;
  }
  else
  {
    Height = 0.0;
    if (-[BKWebViewProxy hasWKWebView](self, "hasWKWebView"))
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKWebViewProxy loader](self, "loader"));
      objc_msgSend(v10, "desiredWebViewFrame");
      Height = CGRectGetHeight(v12);

    }
  }

  return Height;
}

- (void)scrollToPage:(int64_t)a3 paginationMode:(unint64_t)a4 pageProgressionDirection:(int)a5 configuration:(id)a6
{
  -[BKWebViewProxy _wk2_scrollToPage:paginationMode:pageProgressionDirection:configuration:](self, "_wk2_scrollToPage:paginationMode:pageProgressionDirection:configuration:", a3, a4, *(_QWORD *)&a5, a6);
}

- (void)_wk2_scrollToPage:(int64_t)a3 paginationMode:(unint64_t)a4 pageProgressionDirection:(int)a5 configuration:(id)a6
{
  id v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  id v21;
  double v22;
  double v23;
  double v24;
  double v25;
  id v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  _QWORD v33[5];
  id v34;
  int64_t v35;
  unint64_t v36;
  int v37;
  uint8_t buf[4];
  void *v39;
  __int16 v40;
  void *v41;
  __int16 v42;
  void *v43;
  __int16 v44;
  void *v45;

  v10 = a6;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[BKWebViewProxy loader](self, "loader"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "webView"));

  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472;
  v33[2] = sub_85814;
  v33[3] = &unk_1C0C50;
  v33[4] = self;
  v35 = a3;
  v36 = a4;
  v37 = a5;
  v13 = v10;
  v34 = v13;
  v14 = objc_retainBlock(v33);
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "scrollView"));
  objc_msgSend(v15, "contentSize");
  v17 = v16;
  v19 = v18;

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[BKWebViewProxy loader](self, "loader"));
  v21 = objc_msgSend(v20, "pageCount");

  objc_msgSend(v13, "be_pageLength");
  v23 = v22;
  if ((a4 & 0xFFFFFFFFFFFFFFFBLL) != 0)
    v24 = v17;
  else
    v24 = v19;
  v25 = v24 / (double)(uint64_t)v21;
  if (v25 < v22 * 0.8)
  {
    v26 = _AEBookPluginsPageTurnLog();
    v27 = objc_claimAutoreleasedReturnValue(v26);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v24));
      v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v23 * (double)-[BKWebViewProxy pageCount](self, "pageCount")));
      v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v25));
      v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v23 * 0.8));
      *(_DWORD *)buf = 138413058;
      v39 = v28;
      v40 = 2112;
      v41 = v29;
      v42 = 2112;
      v43 = v30;
      v44 = 2112;
      v45 = v31;
      _os_log_impl(&dword_0, v27, OS_LOG_TYPE_INFO, "contentLength is %@ but a size more like %@ seems more plausible. we compared %@ against %@", buf, 0x2Au);

    }
    goto LABEL_13;
  }
  if (v17 == CGSizeZero.width && v19 == CGSizeZero.height)
  {
LABEL_13:
    objc_msgSend(v12, "_doAfterNextPresentationUpdate:", v14);
    goto LABEL_14;
  }
  ((void (*)(_QWORD *))v14[2])(v14);
LABEL_14:

}

- (void)_butActually_wk2_scrollToPage:(int64_t)a3 paginationMode:(unint64_t)a4 pageProgressionDirection:(int)a5 configuration:(id)a6
{
  id v10;
  void *v11;
  char *v12;
  void *v13;
  void *v14;
  unsigned int v15;
  id v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  int64_t v23;
  id v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  void *v36;
  void *v37;
  void *v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  id v47;
  double v48;
  CGFloat v49;
  double v50;
  CGFloat v51;
  id v52;
  NSObject *v53;
  void *v54;
  void *v55;
  void *v56;
  id v57;
  double v58;
  double v59;
  double v60;
  double v61;
  CGFloat v62;
  double v63;
  CGFloat v64;
  double v65;
  double v66;
  CGFloat v67;
  CGFloat v68;
  double v69;
  CGFloat v70;
  uint64_t v71;
  CGFloat v72;
  CGFloat v73;
  CGFloat v74;
  CGFloat v75;
  CGFloat width;
  CGFloat height;
  double v78;
  double v79;
  double v80;
  double v81;
  double v82;
  float v83;
  int v84;
  double v85;
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
  void *v97;
  void *v98;
  double v99;
  double v100;
  void *v101;
  void *v102;
  void *v103;
  double v104;
  double v105;
  id v106;
  NSObject *v107;
  void *v108;
  uint64_t v109;
  uint64_t v110;
  void *v111;
  void *v112;
  uint64_t v113;
  uint64_t v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  double v120;
  int64_t v121;
  double v122;
  CGFloat v123;
  CGFloat v124;
  void *v125;
  double v126;
  void *v127;
  void *v128;
  double v129;
  void *v130;
  _QWORD v131[2];
  _QWORD v132[2];
  _QWORD v133[2];
  _QWORD v134[2];
  _QWORD v135[2];
  uint8_t buf[4];
  void *v137;
  __int16 v138;
  void *v139;
  __int16 v140;
  void *v141;
  __int16 v142;
  void *v143;
  __int16 v144;
  void *v145;
  __int16 v146;
  void *v147;
  CGPoint v148;
  CGRect v149;
  CGRect v150;
  CGRect v151;
  CGRect v152;
  CGRect v153;
  CGRect v154;
  CGRect v155;
  CGRect v156;

  v10 = a6;
  if ((unint64_t)a3 <= 0x7FFFFFFFFFFFFFFELL)
  {
    if (-[BKWebViewProxy hasWKWebView](self, "hasWKWebView"))
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[BKWebViewProxy loader](self, "loader"));
      v12 = (char *)objc_msgSend(v11, "pageCount");

    }
    else
    {
      v12 = 0;
    }
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[BKWebViewProxy loader](self, "loader"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "webView"));
    v15 = objc_msgSend(v14, "isLoading");

    if (v15 && (uint64_t)v12 <= 0)
    {
      v16 = _AEBookPluginsPageTurnLog();
      v17 = objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        v18 = (void *)objc_claimAutoreleasedReturnValue(-[BKWebViewProxy loader](self, "loader"));
        v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v18, "ordinal")));
        v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a3));
        *(_DWORD *)buf = 138412546;
        v137 = v19;
        v138 = 2112;
        v139 = v20;
        _os_log_impl(&dword_0, v17, OS_LOG_TYPE_ERROR, "Attempt to turn pages in:%@ to %@ when we are not loaded and have no known pagecount.", buf, 0x16u);

LABEL_12:
      }
    }
    else
    {
      if (v12 != (char *)0x7FFFFFFFFFFFFFFFLL)
      {
        if ((uint64_t)v12 >= a3)
        {
          v23 = a3;
        }
        else
        {
          v23 = (int64_t)(v12 - 1);
          v24 = _AEBookPluginsPageTurnLog();
          v25 = objc_claimAutoreleasedReturnValue(v24);
          if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
          {
            v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a3));
            v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v12));
            v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v12 - 1));
            *(_DWORD *)buf = 138412802;
            v137 = v26;
            v138 = 2112;
            v139 = v27;
            v140 = 2112;
            v141 = v28;
            _os_log_impl(&dword_0, v25, OS_LOG_TYPE_ERROR, "Attempt to turn to page %@ when we have %@ pages -- setting pageOffset to %@", buf, 0x20u);

            v23 = (int64_t)(v12 - 1);
          }

        }
        v29 = (void *)objc_claimAutoreleasedReturnValue(-[BKWebViewProxy loader](self, "loader"));
        v17 = objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "webView"));

        -[NSObject frame](v17, "frame");
        v31 = v30;
        v33 = v32;
        v123 = v35;
        v124 = v34;
        v36 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject scrollView](v17, "scrollView"));
        v37 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject be_estimatedContentSizeValue](v17, "be_estimatedContentSizeValue"));
        v38 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject be_requestedContentOffset](v17, "be_requestedContentOffset"));
        objc_msgSend(v36, "contentOffset");
        v40 = v39;
        v42 = v41;
        objc_msgSend(v36, "contentSize");
        v44 = v43;
        v46 = v45;
        if (v38)
        {
          v47 = objc_msgSend(v38, "CGPointValue");
          v49 = v48;
          v51 = v50;
          v149.origin.x = CGRectMakeWithSize(v47, v44, v46);
          v148.x = v49;
          v148.y = v51;
          if (CGRectContainsPoint(v149, v148))
          {
            if (v40 == CGPointZero.x && v42 == CGPointZero.y)
            {
              v42 = v51;
              v40 = v49;
            }
          }
          else
          {
            v121 = v23;
            v52 = _AEBookPluginsPageTurnLog();
            v53 = objc_claimAutoreleasedReturnValue(v52);
            if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
            {
              v125 = v38;
              *(CGFloat *)v135 = v49;
              *(CGFloat *)&v135[1] = v51;
              v128 = v36;
              v54 = v37;
              v55 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithBytes:objCType:](NSValue, "valueWithBytes:objCType:", v135, "{CGPoint=dd}"));
              *(double *)v134 = v44;
              *(double *)&v134[1] = v46;
              v56 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithBytes:objCType:](NSValue, "valueWithBytes:objCType:", v134, "{CGSize=dd}"));
              *(_DWORD *)buf = 138412546;
              v137 = v55;
              v138 = 2112;
              v139 = v56;
              _os_log_impl(&dword_0, v53, OS_LOG_TYPE_ERROR, "Requested content offset outside availabe content! offset: %@ contentSize: %@", buf, 0x16u);

              v38 = v125;
              v37 = v54;
              v36 = v128;
            }

            v23 = v121;
          }
        }
        if (objc_msgSend(v10, "isScroll"))
        {
          if (v37)
          {
            v126 = v40;
            v129 = v42;
            v57 = objc_msgSend(v37, "CGSizeValue");
            v59 = v58;
            v61 = v60;
            v62 = CGRectMakeWithSize(v57, v44, v46);
            v64 = v63;
            v120 = v46;
            v122 = v44;
            v65 = v31;
            v67 = v66;
            v68 = v33;
            v70 = v69;
            v156.origin.x = CGRectMakeWithSize(v71, v59, v61);
            v156.origin.y = v72;
            v156.size.width = v73;
            v156.size.height = v74;
            v150.origin.x = v62;
            v150.origin.y = v64;
            v150.size.width = v67;
            v75 = v65;
            v44 = v122;
            v150.size.height = v70;
            v151 = CGRectUnion(v150, v156);
            width = v151.size.width;
            height = v151.size.height;
            v151.origin.x = v75;
            v151.origin.y = v68;
            v151.size.width = v124;
            v151.size.height = v123;
            if (v122 <= CGRectGetWidth(v151))
            {
              v152.origin.x = v75;
              v152.origin.y = v68;
              v152.size.width = v124;
              v152.size.height = v123;
              v46 = v120;
              v40 = v126;
              v42 = v129;
              if (v120 <= CGRectGetHeight(v152))
              {
                v46 = height;
                v44 = width;
              }
            }
            else
            {
              v40 = v126;
              v42 = v129;
              v46 = v120;
            }
          }
          if (objc_msgSend(v10, "layout") == (char *)&dword_0 + 2)
          {
            objc_msgSend(v10, "contentLayoutSize");
            v88 = v87;
            objc_msgSend(v10, "contentInsets");
            v90 = -(v89 - v88 * (double)v23);
            objc_msgSend(v36, "bounds");
            v91 = v46 - CGRectGetHeight(v153);
            if (v90 < v91)
              v91 = v90;
            if (v91 >= 0.0)
              v42 = v91;
            else
              v42 = 0.0;
          }
          else if (objc_msgSend(v10, "layout") == (char *)&dword_0 + 3)
          {
            -[BKWebViewProxy scrollingPageWidthForPaginationMode:configuration:](self, "scrollingPageWidthForPaginationMode:configuration:", a4, v10);
            v93 = v92;
            objc_msgSend(v10, "contentInsets");
            if (a5 == 1)
              v96 = v44 - v93 * (double)(v23 + 1) + v95;
            else
              v96 = -(v94 - v93 * (double)v23);
            objc_msgSend(v36, "bounds");
            v105 = v44 - CGRectGetWidth(v155);
            if (v96 < v105)
              v105 = v96;
            if (v105 >= 0.0)
              v40 = v105;
            else
              v40 = 0.0;
          }
        }
        else
        {
          objc_msgSend(v10, "contentLayoutSize");
          v79 = v78;
          objc_msgSend(v10, "gutterWidth");
          v81 = v80;
          objc_msgSend(v10, "gutterWidth");
          if (v23)
          {
            v83 = v79 + v81;
            v84 = (int)((float)((float)(uint64_t)v12 * v83) - v82);
            v85 = (float)((float)v23 * v83);
            if (v85 > (double)v84)
              v85 = (double)v84;
          }
          else
          {
            v85 = 0.0;
          }
          v86 = v38;
          if (a5 == 1)
          {
            if (objc_msgSend(v10, "layout") == (char *)&dword_0 + 2)
            {
              v85 = -v85;
            }
            else
            {
              v97 = (void *)objc_claimAutoreleasedReturnValue(-[BKWebViewProxy loader](self, "loader"));
              v98 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v97, "webView"));
              objc_msgSend(v98, "bounds");
              v99 = CGRectGetWidth(v154);

              objc_msgSend(v10, "contentLayoutSize");
              v85 = v99 - (v85 + v100);
            }
          }
          v101 = (void *)objc_claimAutoreleasedReturnValue(-[BKWebViewProxy loader](self, "loader"));
          v102 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v101, "webView"));
          v103 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v102, "be_contentView"));
          v42 = 0.0;
          objc_msgSend(v103, "convertPoint:toView:", v36, v85, 0.0);
          v40 = v104;

          v38 = v86;
        }
        v106 = _AEBookPluginsLifeCycleLog();
        v107 = objc_claimAutoreleasedReturnValue(v106);
        if (os_log_type_enabled(v107, OS_LOG_TYPE_DEFAULT))
        {
          *(double *)v133 = v40;
          *(double *)&v133[1] = v42;
          v108 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithBytes:objCType:](NSValue, "valueWithBytes:objCType:", v133, "{CGPoint=dd}"));
          v127 = v38;
          objc_msgSend(v36, "contentOffset");
          v132[0] = v109;
          v132[1] = v110;
          v130 = v36;
          v111 = v37;
          v112 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithBytes:objCType:](NSValue, "valueWithBytes:objCType:", v132, "{CGPoint=dd}"));
          objc_msgSend(v130, "contentSize");
          v131[0] = v113;
          v131[1] = v114;
          v115 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithBytes:objCType:](NSValue, "valueWithBytes:objCType:", v131, "{CGSize=dd}"));
          v116 = (void *)objc_claimAutoreleasedReturnValue(-[BKWebViewProxy loader](self, "loader"));
          v117 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v116, "ordinal")));
          *(_DWORD *)buf = 138544642;
          v137 = v108;
          v138 = 2114;
          v139 = v112;
          v140 = 2114;
          v141 = v127;
          v142 = 2114;
          v143 = v115;
          v144 = 2114;
          v145 = v111;
          v146 = 2114;
          v147 = v117;
          _os_log_impl(&dword_0, v107, OS_LOG_TYPE_DEFAULT, "BKWVP scrollToPage contentOffset:%{public}@ currentScrollViewOffset:%{public}@ requestedContentOffset:%{public}@ scrollViewContentSize:%{public}@ estimatedContentSize:%{public}@ ordinal:%{public}@", buf, 0x3Eu);

          v38 = v127;
          v37 = v111;
          v36 = v130;

        }
        v118 = (void *)objc_claimAutoreleasedReturnValue(-[BKWebViewProxy loader](self, "loader"));
        v119 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v118, "webView"));
        objc_msgSend(v119, "be_setContentOffset:", v40, v42);

        goto LABEL_59;
      }
      v21 = _AEBookPluginsPageTurnLog();
      v17 = objc_claimAutoreleasedReturnValue(v21);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", 0x7FFFFFFFFFFFFFFFLL));
        v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a3));
        *(_DWORD *)buf = 138543618;
        v137 = v18;
        v138 = 2114;
        v139 = v22;
        _os_log_impl(&dword_0, v17, OS_LOG_TYPE_ERROR, "Attempt to set invalid offset - totalPages:%{public}@ pageOffset:%{public}@", buf, 0x16u);

        goto LABEL_12;
      }
    }
LABEL_59:

  }
}

- (BKWK2WebViewLoader)loader
{
  return self->_loader;
}

- (void)setLoader:(id)a3
{
  objc_storeStrong((id *)&self->_loader, a3);
}

- (BOOL)hasWKWebView
{
  return self->_hasWKWebView;
}

- (void)setHasWKWebView:(BOOL)a3
{
  self->_hasWKWebView = a3;
}

- (CGRect)localFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_localFrame.origin.x;
  y = self->_localFrame.origin.y;
  width = self->_localFrame.size.width;
  height = self->_localFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setLocalFrame:(CGRect)a3
{
  self->_localFrame = a3;
}

- (unint64_t)retryCount
{
  return self->_retryCount;
}

- (void)setRetryCount:(unint64_t)a3
{
  self->_retryCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loader, 0);
}

@end
