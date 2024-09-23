@implementation BCCardSetState

- (BOOL)ignoreContentOffsetForCardViewController:(id)a3
{
  return -[BCCardSetState contentOffsetUpdatesSuspended](self, "contentOffsetUpdatesSuspended", a3);
}

+ (BCCardSetExpandedState)expandedState
{
  if (qword_311370 != -1)
    dispatch_once(&qword_311370, &stru_291F38);
  return (BCCardSetExpandedState *)(id)qword_311368;
}

+ (BCCardSetContractedState)contractedState
{
  if (qword_311380 != -1)
    dispatch_once(&qword_311380, &stru_291F58);
  return (BCCardSetContractedState *)(id)qword_311378;
}

+ (BCCardSetExpandingState)expandingState
{
  if (qword_311390 != -1)
    dispatch_once(&qword_311390, &stru_291F78);
  return (BCCardSetExpandingState *)(id)qword_311388;
}

+ (BCCardSetContractingState)contractingState
{
  if (qword_3113A0 != -1)
    dispatch_once(&qword_3113A0, &stru_291F98);
  return (BCCardSetContractingState *)(id)qword_311398;
}

+ (BCCardSetDismissingState)dismissingState
{
  if (qword_3113B0 != -1)
    dispatch_once(&qword_3113B0, &stru_291FB8);
  return (BCCardSetDismissingState *)(id)qword_3113A8;
}

+ (BCCardSetPushedState)pushedState
{
  if (qword_3113C0 != -1)
    dispatch_once(&qword_3113C0, &stru_291FD8);
  return (BCCardSetPushedState *)(id)qword_3113B8;
}

+ (BCCardSetPushedContractedState)pushedContractedState
{
  if (qword_3113D0 != -1)
    dispatch_once(&qword_3113D0, &stru_291FF8);
  return (BCCardSetPushedContractedState *)(id)qword_3113C8;
}

+ (id)cardViewControllerExpandedState:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "cardNavigationController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "childViewControllers"));
  if ((unint64_t)objc_msgSend(v5, "count") > 1)
    v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "pushedState"));
  else
    v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "expandedState"));
  v7 = (void *)v6;

  return v7;
}

+ (id)cardViewControllerContractedState:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "cardNavigationController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "childViewControllers"));
  if ((unint64_t)objc_msgSend(v5, "count") > 1)
    v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "pushedContractedState"));
  else
    v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "contractedState"));
  v7 = (void *)v6;

  return v7;
}

- (double)cardViewControllerStatusBarBackgroundOpacity:(id)a3
{
  id v3;
  double v4;
  void *v5;

  v3 = a3;
  v4 = 0.0;
  if ((_os_feature_enabled_impl("Books", "unifiedProductPage") & 1) == 0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "cardNavigationController"));
    if (objc_msgSend(v5, "isNavigationBarHidden"))
      v4 = 1.0;
    else
      v4 = 0.0;

  }
  return v4;
}

- (double)cardViewController:(id)a3 cardYPositionInScreenFromCardScrollView:(id)a4 cardData:(id)a5
{
  id v8;
  id v9;
  double v10;
  double v11;

  v8 = a5;
  v9 = a3;
  -[BCCardSetState yInScrollView:cardViewController:](self, "yInScrollView:cardViewController:", a4, v9);
  -[BCCardSetState yInScreenFromYInScrollView:cardViewController:cardData:](self, "yInScreenFromYInScrollView:cardViewController:cardData:", v9, v8);
  v11 = v10;

  return v11;
}

- (BOOL)transitioning
{
  return 0;
}

- (BOOL)useContentInsetForContentForScrollIndicatorInsets
{
  return 0;
}

- (double)yInScrollView:(id)a3 cardViewController:(id)a4
{
  id v5;
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "contentOffset");
  v8 = v7;
  objc_msgSend(v5, "adjustedContentInset");
  v10 = v8 + v9;

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "cardSetViewController"));
  objc_msgSend(v11, "scaledContractedOffset");
  v13 = v12 - v10;

  return v13;
}

- (double)yInScreenFromYInScrollView:(double)a3 cardViewController:(id)a4 cardData:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _BOOL4 v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  double v20;
  double v21;

  v7 = a5;
  v8 = a4;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "cardSetData"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "scrollView"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "layer"));

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "presentationLayer"));
  if (v12)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "animator"));
    v14 = v13 != 0;

  }
  else
  {
    v14 = 0;
  }

  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "cardSetViewController"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "view"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "layer"));

  if (v14)
  {
    v18 = objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "presentationLayer"));

    v19 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "presentationLayer"));
    v11 = (void *)v19;
    v17 = (void *)v18;
  }
  objc_msgSend(v11, "convertPoint:toLayer:", v17, 0.0, a3);
  v21 = v20;

  return v21;
}

- (void)cardViewController:(id)a3 repositionOffsetsWithContentScrollView:(id)a4 cardData:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "scrollView"));
  -[BCCardSetState updateCardViewController:contentScrollView:basedOnCardScrollView:cardData:](self, "updateCardViewController:contentScrollView:basedOnCardScrollView:cardData:", v10, v9, v11, v8);

}

- (void)updateCardViewController:(id)a3 contentScrollView:(id)a4 basedOnCardScrollView:(id)a5 cardData:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _BOOL4 v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  double v28;
  CGFloat v29;
  double v30;
  CGFloat v31;
  double v32;
  CGFloat v33;
  double v34;
  CGFloat v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  id v41;
  void *v42;
  unsigned int v43;
  double v44;
  double v45;
  double v46;
  double v47;
  __int128 v48;
  double v49;
  double v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  double v58;
  void *v59;
  unsigned int v60;
  double v61;
  double v62;
  CGAffineTransform v63;
  CGAffineTransform v64;
  _OWORD v65[3];
  __int128 v66;
  __int128 v67;
  __int128 v68;
  CGAffineTransform v69;
  CGAffineTransform v70;
  CGRect v71;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "configuration"));
  objc_msgSend(v14, "cardExpandedTopOffset");
  v16 = v15;

  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "cardSetData"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "scrollView"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "layer"));

  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "presentationLayer"));
  if (v20)
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "animator"));
    v22 = v21 != 0;

  }
  else
  {
    v22 = 0;
  }

  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "cardSetViewController"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "view"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "layer"));

  if (v22)
  {
    v26 = objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "presentationLayer"));

    v27 = objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "presentationLayer"));
    v25 = (void *)v26;
    v19 = (void *)v27;
  }
  objc_msgSend(v25, "frame");
  objc_msgSend(v19, "convertRect:fromLayer:", v25);
  v29 = v28;
  v31 = v30;
  v33 = v32;
  v35 = v34;
  -[BCCardSetState yInScrollView:cardViewController:](self, "yInScrollView:cardViewController:", v12, v10);
  v37 = v36;
  v71.origin.x = v29;
  v71.origin.y = v31;
  v71.size.width = v33;
  v71.size.height = v35;
  v38 = CGRectGetMinY(v71) - v37;
  objc_msgSend(v25, "convertPoint:toLayer:", v19, 0.0, v16);
  v40 = fmin(v38, -v39);
  v41 = v12;
  v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "topContentViewController"));
  v43 = objc_msgSend(v42, "prefersAdditionalSafeAreaInsetsForInsetting");

  objc_msgSend(v41, "contentOffset");
  v45 = v44;
  if (v43)
    objc_msgSend(v41, "adjustedContentInset");
  else
    objc_msgSend(v41, "contentInset");
  v47 = v46;

  if (v40 <= 0.0)
  {
    v48 = *(_OWORD *)&CGAffineTransformIdentity.c;
    *(_OWORD *)&v70.a = *(_OWORD *)&CGAffineTransformIdentity.a;
    *(_OWORD *)&v70.c = v48;
    *(_OWORD *)&v70.tx = *(_OWORD *)&CGAffineTransformIdentity.tx;
  }
  else
  {
    CGAffineTransformMakeTranslation(&v70, 0.0, v40);
  }
  v49 = fmax(v38 - v40, 0.0);
  v50 = v45 + v47;
  v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "cardNavigationController"));
  v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "view"));
  v69 = v70;
  objc_msgSend(v52, "setTransform:", &v69);

  v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "cardNavigationController"));
  v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "view"));
  v55 = v54;
  if (v54)
  {
    objc_msgSend(v54, "transform");
  }
  else
  {
    v67 = 0u;
    v68 = 0u;
    v66 = 0u;
  }
  v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "auxiliaryNavigationBarView"));
  v65[0] = v66;
  v65[1] = v67;
  v65[2] = v68;
  objc_msgSend(v56, "setTransform:", v65);

  CGAffineTransformMakeTranslation(&v64, 0.0, -(v50 - v49));
  v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "cardView"));
  v63 = v64;
  objc_msgSend(v57, "setTransform:", &v63);

  v58 = fmax(v38, 0.0);
  v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "topContentViewController"));
  v60 = objc_msgSend(v59, "prefersAdditionalSafeAreaInsetsForInsetting");

  if (v60)
    objc_msgSend(v11, "adjustedContentInset");
  else
    objc_msgSend(v11, "contentInset");
  v62 = v58 - v61;
  -[BCCardSetState setContentOffsetUpdatesSuspended:](self, "setContentOffsetUpdatesSuspended:", 1);
  objc_msgSend(v11, "setContentOffset:", 0.0, v62);
  -[BCCardSetState setContentOffsetUpdatesSuspended:](self, "setContentOffsetUpdatesSuspended:", 0);

}

- (double)cardViewController:(id)a3 cardScrollViewOffsetForContentScrollView:(id)a4 cardData:(id)a5
{
  void *v5;
  double v6;
  double v7;

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "scrollView"));
  objc_msgSend(v5, "contentOffset");
  v7 = v6;

  return v7;
}

- (CGSize)_adjustedContentSizeForCardViewController:(id)a3 contentSize:(CGSize)a4 includeDistanceToExpand:(BOOL)a5
{
  _BOOL4 v5;
  double height;
  id v7;
  void *v8;
  void *v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGSize result;

  v5 = a5;
  height = a4.height;
  v7 = a3;
  v8 = v7;
  if (v5)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "cardSetViewController"));
    objc_msgSend(v9, "scaledContractedOffset");
    height = height + v10;

  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "view"));
  objc_msgSend(v11, "bounds");
  v13 = v12;

  v14 = v13;
  v15 = height;
  result.height = v15;
  result.width = v14;
  return result;
}

- (void)cardViewController:(id)a3 updateContentSize:(CGSize)a4
{
  double height;
  double width;
  id v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  id v13;

  height = a4.height;
  width = a4.width;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "configuration"));
  -[BCCardSetState _adjustedContentSizeForCardViewController:contentSize:includeDistanceToExpand:](self, "_adjustedContentSizeForCardViewController:contentSize:includeDistanceToExpand:", v7, objc_msgSend(v8, "cardsCanExpand"), width, height);
  v10 = v9;
  v12 = v11;

  v13 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "scrollView"));
  objc_msgSend(v13, "setContentSize:", v10, v12);

}

- (void)updateCardSize:(id)a3 addExtra:(BOOL)a4
{
  _BOOL4 v4;
  id v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  uint64_t v11;
  void *v12;
  unsigned int v13;
  double v14;
  void *v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  id v21;
  NSObject *v22;
  double CenterNoRounding;
  double v24;
  double v25;
  void *v26;
  void *v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  void *v35;
  void *v36;
  unsigned __int8 v37;
  void *v38;
  double v39;
  double v40;
  uint64_t v41;
  double v42;
  double v43;
  double v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  void *v56;
  void *v57;
  int v58;
  double v59;

  v4 = a4;
  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "view"));
  objc_msgSend(v6, "bounds");
  CGRectMakeWithSize(v7, v8);
  v10 = v9;

  if (v4)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "configuration"));
    v13 = objc_msgSend(v12, "cardsCanExpand");

    v14 = v10;
    if (v13)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "configuration"));
      objc_msgSend(v15, "cardExpandedTopOffset");
      v14 = v10 - v16;

    }
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "configuration"));
    objc_msgSend(v17, "cardCornerRadius");
    v19 = v14 + v18;

    if (v19 <= 0.0)
    {
      v21 = BCCardModelLog();
      v22 = objc_claimAutoreleasedReturnValue(v21);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        v58 = 134217984;
        v59 = v19;
        _os_log_impl(&dword_0, v22, OS_LOG_TYPE_DEFAULT, "In updateCardSize, addExtra:YES. Resulting height (%f) is <= 0, so not adjusting frame.", (uint8_t *)&v58, 0xCu);
      }

    }
    else
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "cardSetViewController"));
      objc_msgSend(v20, "scaledContractedOffset");

    }
  }
  CenterNoRounding = CGRectGetCenterNoRounding(v11);
  v25 = v24;
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "cardView"));
  objc_msgSend(v26, "setCenter:", CenterNoRounding, v25);

  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "cardView"));
  v28 = CGRectMakeWithOriginSize(objc_msgSend(v27, "bounds"));
  v30 = v29;
  v32 = v31;
  v34 = v33;
  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "cardView"));
  objc_msgSend(v35, "setBounds:", v28, v30, v32, v34);

  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "configuration"));
  if (!objc_msgSend(v36, "cardsCanExpand"))
  {

    goto LABEL_13;
  }
  v37 = objc_msgSend(v5, "expanded");

  if ((v37 & 1) != 0)
  {
LABEL_13:
    v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "view"));
    objc_msgSend(v38, "bounds");
    CGRectMakeWithSize(v39, v40);
    goto LABEL_14;
  }
  v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "cardSetViewController"));
  objc_msgSend(v38, "scaledContractedOffset");
LABEL_14:

  v42 = CGRectGetCenterNoRounding(v41);
  v44 = v43;
  v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "cardNavigationController"));
  v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "view"));
  objc_msgSend(v46, "setCenter:", v42, v44);

  v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "cardNavigationController"));
  v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "view"));
  v49 = CGRectMakeWithOriginSize(objc_msgSend(v48, "bounds"));
  v51 = v50;
  v53 = v52;
  v55 = v54;
  v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "cardNavigationController"));
  v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "view"));
  objc_msgSend(v57, "setBounds:", v49, v51, v53, v55);

}

- (void)cardViewControllerUpdateCardSize:(id)a3
{
  -[BCCardSetState updateCardSize:addExtra:](self, "updateCardSize:addExtra:", a3, 1);
}

- (void)adjustScrollView:(id)a3 newContentOffset:(double)a4 cardData:(id)a5
{
  -[BCCardSetState adjustScrollView:newContentOffset:allowRecursion:cardData:](self, "adjustScrollView:newContentOffset:allowRecursion:cardData:", a3, 0, a5, a4);
}

- (void)adjustScrollView:(id)a3 newContentOffset:(double)a4 allowRecursion:(BOOL)a5 cardData:(id)a6
{
  id v9;
  id v10;
  uint64_t v11;
  id v12;
  _QWORD *v13;
  void (**v14)(_QWORD);
  _QWORD v15[4];
  id v16;
  uint64_t v17;
  double v18;

  v9 = a3;
  v10 = a6;
  objc_msgSend(v9, "contentOffset");
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1352C8;
  v15[3] = &unk_28B9D8;
  v16 = v9;
  v17 = v11;
  v18 = a4;
  v12 = v9;
  v13 = objc_retainBlock(v15);
  v14 = (void (**)(_QWORD))v13;
  if (a5)
  {
    ((void (*)(_QWORD *))v13[2])(v13);
  }
  else
  {
    objc_msgSend(v10, "setSettingContentOffset:", 1);
    v14[2](v14);
    objc_msgSend(v10, "setSettingContentOffset:", 0);
  }

}

- (void)cardViewController:(id)a3 cardData:(id)a4 scrollViewWillBeginDragging:(id)a5 contentScrollView:(id)a6
{
  id v7;
  id v8;

  v7 = a6;

  v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "delegate"));
  objc_msgSend(v8, "scrollViewWillBeginDragging:", v7);

}

- (void)cardViewController:(id)a3 contentScrollViewDidChange:(id)a4 cardData:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("must override %s"), "-[BCCardSetState cardViewController:contentScrollViewDidChange:cardData:]"));
  v11 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", CFSTR("abstract base class"), v10, 0));

  objc_exception_throw(v11);
}

- (void)cardViewController:(id)a3 cardData:(id)a4 scrollViewWillEndDragging:(id)a5 withVelocity:(CGPoint)a6 targetContentOffset:(CGPoint *)a7 contentScrollView:(id)a8
{
  double y;
  id v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  _BOOL4 v28;
  double v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  double v35;
  double v36;
  void *v37;
  double v38;
  void *v39;
  double v40;
  double v41;
  BOOL v42;
  double v43;
  void *v44;
  double v45;
  double v46;
  void *v47;
  double v48;
  double v49;
  double v50;
  double v51;
  id v52;
  CGRect v53;

  y = a6.y;
  v52 = a3;
  v12 = a4;
  v13 = a5;
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "cardNavigationController"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "viewControllers"));
  v16 = objc_msgSend(v15, "count");

  if ((unint64_t)v16 <= 1)
  {
    v17 = a7->y;
    objc_msgSend(v13, "adjustedContentInset");
    v19 = v17 - v18;
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "cardSetViewController"));
    objc_msgSend(v20, "scaledContractedOffset");
    v22 = v21;

    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "cardSetData"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "scrollView"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "layer"));

    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "presentationLayer"));
    if (v26)
    {
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "animator"));
      v28 = v27 != 0;

    }
    else
    {
      v28 = 0;
    }
    v29 = v22 - v19;

    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "cardSetViewController"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "view"));
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "layer"));

    if (v28)
    {
      v33 = objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "presentationLayer"));

      v34 = objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "presentationLayer"));
      v32 = (void *)v33;
      v25 = (void *)v34;
    }
    objc_msgSend(v25, "convertPoint:toLayer:", v32, 0.0, v29);
    v36 = v35;
    v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "configuration"));
    objc_msgSend(v37, "cardExpandedTopOffset");
    if (v36 <= v38)
    {

      goto LABEL_15;
    }
    v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "configuration"));
    objc_msgSend(v39, "cardUnexpandedTopOffset");
    v41 = v40;

    if (v36 >= v41)
    {
LABEL_15:

      goto LABEL_16;
    }
    v42 = y <= 0.0;
    if (y == 0.0)
    {
      v43 = 0.0;
      if (v36 <= 0.0)
        goto LABEL_11;
    }
    else
    {
      v43 = 0.0;
      if (!v42)
      {
LABEL_11:
        v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "cardSetViewController"));
        objc_msgSend(v44, "scaledContractedOffset");
        v46 = v45;
        v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "configuration"));
        objc_msgSend(v47, "cardExpandedTopOffset");
        v43 = v46 - v48 + 1.0;

        objc_msgSend(v13, "bounds");
        v49 = v43 + CGRectGetHeight(v53);
        objc_msgSend(v13, "contentSize");
        if (v49 > v50)
          v43 = 0.0;
      }
    }
    objc_msgSend(v13, "adjustedContentInset");
    a7->y = v43 + v51;
    goto LABEL_15;
  }
LABEL_16:

}

- (void)cardViewController:(id)a3 willDismissWithCardData:(id)a4
{
  id v4;
  id v5;

  v4 = a4;
  objc_msgSend(v4, "setDismissing:", 1);
  v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "scrollView"));

  objc_msgSend(v5, "_stopScrollingAndZoomingAnimations");
}

- (void)_scrollScrollViewToTopForCardViewController:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  double y;
  double v6;
  id v7;

  v4 = a4;
  v7 = a3;
  y = CGPointZero.y;
  objc_msgSend(v7, "adjustedContentInset");
  objc_msgSend(v7, "setContentOffset:animated:", v4, CGPointZero.x, y - v6);

}

- (void)cardViewController:(id)a3 accessibilityWantsToScrollToOffset:(CGPoint)a4 cardData:(id)a5
{
  double y;
  double x;
  id v7;

  y = a4.y;
  x = a4.x;
  v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "scrollView"));
  objc_msgSend(v7, "setContentOffset:", x, y);

}

- (BOOL)cardViewController:(id)a3 dismissPanShouldBegin:(id)a4 cardData:(id)a5
{
  return 0;
}

- (void)cardViewController:(id)a3 dismissPan:(id)a4 cardData:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "scrollView"));
  objc_msgSend(v10, "setScrollEnabled:", 0);

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "scrollView"));
  objc_msgSend(v11, "_stopScrollingAndZoomingAnimations");

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[BCCardSetState dismissingState](BCCardSetState, "dismissingState"));
  objc_msgSend(v7, "setCurrentState:", v12);

  v13 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "currentState"));
  objc_msgSend(v13, "cardViewController:dismissPan:cardData:", v9, v8, v7);

}

- (void)cardViewController:(id)a3 positionCardScrollViewBasedOnContentScrollView:(id)a4 cardDate:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  id v16;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "scrollView"));
  objc_msgSend(v11, "contentOffset");
  v13 = v12;

  -[BCCardSetState cardViewController:cardScrollViewOffsetForContentScrollView:cardData:](self, "cardViewController:cardScrollViewOffsetForContentScrollView:cardData:", v10, v9, v8);
  v15 = v14;

  v16 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "scrollView"));
  objc_msgSend(v16, "setContentOffset:", v13, v15);

}

- (double)_extraGripperOffsetForViewController:(id)a3
{
  return 0.0;
}

- (void)cardViewController:(id)a3 positionAuxiliaryNavigationBarView:(id)a4 cardDate:(id)a5
{
  id v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _BOOL4 v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  double v23;
  CGFloat v24;
  double v25;
  CGFloat v26;
  double v27;
  CGFloat v28;
  double v29;
  CGFloat v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  void *v39;
  double v40;
  double v41;
  void *v42;
  id v43;
  CGRect v44;

  v43 = a3;
  v7 = a5;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "configuration"));
  objc_msgSend(v8, "cardExpandedTopOffset");
  v10 = v9;

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "scrollView"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "cardSetData"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "scrollView"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "layer"));

  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "presentationLayer"));
  if (v15)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "animator"));
    v17 = v16 != 0;

  }
  else
  {
    v17 = 0;
  }

  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "cardSetViewController"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "view"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "layer"));

  if (v17)
  {
    v21 = objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "presentationLayer"));

    v22 = objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "presentationLayer"));
    v20 = (void *)v21;
    v14 = (void *)v22;
  }
  objc_msgSend(v20, "frame");
  objc_msgSend(v14, "convertRect:fromLayer:", v20);
  v24 = v23;
  v26 = v25;
  v28 = v27;
  v30 = v29;
  -[BCCardSetState yInScrollView:cardViewController:](self, "yInScrollView:cardViewController:", v11, v43);
  v32 = v31;
  v44.origin.x = v24;
  v44.origin.y = v26;
  v44.size.width = v28;
  v44.size.height = v30;
  v33 = CGRectGetMinY(v44) - v32;
  objc_msgSend(v20, "convertPoint:toLayer:", v14, 0.0, v10);
  v35 = fmin(v33, -v34);
  -[BCCardSetState _extraGripperOffsetForViewController:](self, "_extraGripperOffsetForViewController:", v43);
  v37 = -v36;
  if (v36 + v35 < v36)
    v36 = v36 + v35;
  if (v35 <= v37)
    v38 = 0.0;
  else
    v38 = v36;
  if (_os_feature_enabled_impl("Books", "unifiedProductPage"))
  {
    v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "auxiliaryNavigationBarTopConstraint"));
    objc_msgSend(v39, "setConstant:", v38);
  }
  else
  {
    v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "configuration"));
    objc_msgSend(v39, "auxiliaryNavigationBarVerticalInset");
    v41 = v38 + v40;
    v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "auxiliaryNavigationBarTopConstraint"));
    objc_msgSend(v42, "setConstant:", v41);

  }
}

- (double)cardViewControllerAuxiliaryNavigationBarAlpha:(id)a3 cardData:(id)a4
{
  double result;

  -[BCCardSetState _cardViewControllerAuxiliaryNavigationBarAlpha:cardData:](self, "_cardViewControllerAuxiliaryNavigationBarAlpha:cardData:", a3, a4);
  return result;
}

- (double)_cardViewControllerAuxiliaryNavigationBarAlpha:(id)a3 cardData:(id)a4
{
  return 1.0;
}

- (BOOL)prefersStatusBarBackgroundHidden
{
  return self->_prefersStatusBarBackgroundHidden;
}

- (BOOL)contentOffsetUpdatesSuspended
{
  return self->_contentOffsetUpdatesSuspended;
}

- (void)setContentOffsetUpdatesSuspended:(BOOL)a3
{
  self->_contentOffsetUpdatesSuspended = a3;
}

@end
