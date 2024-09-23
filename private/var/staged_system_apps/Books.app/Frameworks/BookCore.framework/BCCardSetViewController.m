@implementation BCCardSetViewController

- (BCCardSetViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  BCCardSetViewController *v4;
  BCCardSetViewController *v5;
  NSMutableDictionary *v6;
  NSMutableDictionary *suspendedCardViewControllers;
  uint64_t v8;
  NSMapTable *suspendedCardsScrollingAssertions;
  void *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)BCCardSetViewController;
  v4 = -[BCCardSetViewController initWithNibName:bundle:](&v12, "initWithNibName:bundle:", a3, a4);
  v5 = v4;
  if (v4)
  {
    v4->_currentIndex = -1;
    v6 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    suspendedCardViewControllers = v5->_suspendedCardViewControllers;
    v5->_suspendedCardViewControllers = v6;

    v8 = objc_claimAutoreleasedReturnValue(+[NSMapTable mapTableWithStrongToStrongObjects](NSMapTable, "mapTableWithStrongToStrongObjects"));
    suspendedCardsScrollingAssertions = v5->_suspendedCardsScrollingAssertions;
    v5->_suspendedCardsScrollingAssertions = (NSMapTable *)v8;

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v10, "addObserver:selector:name:object:", v5, "_applicationWillEnterForegroundNotification:", UIApplicationWillEnterForegroundNotification, 0);
    objc_msgSend(v10, "addObserver:selector:name:object:", v5, "_applicationDidEnterBackgroundNotification:", UIApplicationDidEnterBackgroundNotification, 0);

  }
  return v5;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:name:object:", self, UIApplicationWillEnterForegroundNotification, 0);
  objc_msgSend(v3, "removeObserver:name:object:", self, UIApplicationDidEnterBackgroundNotification, 0);

  v4.receiver = self;
  v4.super_class = (Class)BCCardSetViewController;
  -[BCCardSetViewController dealloc](&v4, "dealloc");
}

- (void)_applicationWillEnterForegroundNotification:(id)a3
{
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  unsigned int v16;
  unsigned int v17;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardSetViewController viewState](self, "viewState", a3));

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardSetViewController view](self, "view"));
    objc_msgSend(v5, "size");
    v7 = v6;
    v9 = v8;
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardSetViewController viewState](self, "viewState"));
    objc_msgSend(v10, "viewSize");
    v12 = v11;
    v14 = v13;

    if (v7 == v12 && v9 == v14)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardSetViewController viewState](self, "viewState"));
      v16 = objc_msgSend(v15, "isExpanded");
      v17 = -[BCCardSetViewController expanded](self, "expanded");

      if (v16 != v17)
      {
        if (-[BCCardSetViewController expanded](self, "expanded"))
          -[BCCardSetViewController goContracted](self, "goContracted");
        else
          -[BCCardSetViewController goExpanded](self, "goExpanded");
      }
    }
    -[BCCardSetViewController setViewState:](self, "setViewState:", 0);
  }
}

- (void)_applicationDidEnterBackgroundNotification:(id)a3
{
  void *v4;
  BCCardSetViewControllerViewState *v5;
  _BOOL8 v6;
  BCCardSetViewControllerViewState *v7;
  id v8;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardSetViewController viewState](self, "viewState", a3));

  if (!v4)
  {
    v5 = [BCCardSetViewControllerViewState alloc];
    v6 = -[BCCardSetViewController expanded](self, "expanded");
    v8 = (id)objc_claimAutoreleasedReturnValue(-[BCCardSetViewController view](self, "view"));
    objc_msgSend(v8, "size");
    v7 = -[BCCardSetViewControllerViewState initWithIsExpanded:viewSize:](v5, "initWithIsExpanded:viewSize:", v6);
    -[BCCardSetViewController setViewState:](self, "setViewState:", v7);

  }
}

- (id)expandedCardViewController
{
  void *v3;

  if (-[BCCardSetViewController expanded](self, "expanded"))
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardSetViewController currentCardViewController](self, "currentCardViewController"));
  else
    v3 = 0;
  return v3;
}

- (BCCardViewController)currentCardViewController
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardSetViewController displayedCardViewControllers](self, "displayedCardViewControllers"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[BCCardSetViewController currentIndex](self, "currentIndex")));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", v4));

  return (BCCardViewController *)v5;
}

- (unint64_t)cardCount
{
  void *v3;
  void *v4;
  id v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardSetViewController dataSource](self, "dataSource"));
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardSetViewController dataSource](self, "dataSource"));
    v5 = objc_msgSend(v4, "cardCountForCardSet:", self);

  }
  else
  {
    v5 = 0;
  }

  return (unint64_t)v5;
}

- (void)setContentInset:(UIEdgeInsets)a3
{
  void *v7;
  _QWORD v8[5];

  if (self->_contentInset.left != a3.left
    || self->_contentInset.top != a3.top
    || self->_contentInset.right != a3.right
    || self->_contentInset.bottom != a3.bottom)
  {
    self->_contentInset = a3;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardSetViewController displayedCardViewControllers](self, "displayedCardViewControllers"));
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_4D430;
    v8[3] = &unk_28D6C0;
    v8[4] = self;
    objc_msgSend(v7, "enumerateKeysAndObjectsUsingBlock:", v8);

  }
}

- (void)setLastNavigationType:(int64_t)a3
{
  char *v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;

  self->_lastNavigationType = a3;
  v5 = (char *)-[BCCardSetViewController visibleCardRange](self, "visibleCardRange");
  if (v6)
  {
    v7 = v5;
    v8 = v6;
    do
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardSetViewController cardViewControllerAtIndex:](self, "cardViewControllerAtIndex:", v7));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "topContentViewController"));
      v11 = BUProtocolCast(&OBJC_PROTOCOL___BCCardCycleObserving, v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue(v11);

      objc_msgSend(v12, "cardSetViewController:willUpdateWithNavigationType:", self, a3);
      ++v7;
      --v8;
    }
    while (v8);
  }
}

- (int64_t)lastNavigationType
{
  return self->_lastNavigationType;
}

- (double)_cardSeparation
{
  void *v3;
  double Width;
  void *v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  CGRect v12;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardSetViewController view](self, "view"));
  objc_msgSend(v3, "bounds");
  Width = CGRectGetWidth(v12);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardSetViewController configuration](self, "configuration"));
  objc_msgSend(v5, "cardGapForContainerWidth:", Width);
  v7 = v6;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardSetViewController configuration](self, "configuration"));
  objc_msgSend(v8, "cardContractedScale");
  v10 = v7 / v9;

  return v10;
}

- (double)cutoffToDismissScrollView:(id)a3
{
  double Height;
  double v5;
  CGRect v7;

  objc_msgSend(a3, "frame");
  Height = CGRectGetHeight(v7);
  -[BCCardSetViewController distanceToExpand](self, "distanceToExpand");
  return floor((Height - v5) * 0.2);
}

- (double)scaleOffset:(double)a3 withTransform:(CGAffineTransform *)a4
{
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  __int128 v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  double height;
  void *v21;
  double v22;
  double v23;
  CGAffineTransform v25;
  CGRect v26;

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardSetViewController view](self, "view"));
  objc_msgSend(v7, "bounds");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;

  v16 = *(_OWORD *)&a4->c;
  *(_OWORD *)&v25.a = *(_OWORD *)&a4->a;
  *(_OWORD *)&v25.c = v16;
  *(_OWORD *)&v25.tx = *(_OWORD *)&a4->tx;
  v17 = v9;
  *(_QWORD *)&v16 = v11;
  v18 = v13;
  v19 = v15;
  v26 = CGRectApplyAffineTransform(*(CGRect *)((char *)&v16 - 8), &v25);
  height = v26.size.height;
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardSetViewController view](self, "view", v26.origin.x, v26.origin.y, v26.size.width));
  objc_msgSend(v21, "bounds");
  v23 = (a3 + (v22 - height) * -0.5) / a4->d;

  return v23;
}

- (void)updateContractedTransform
{
  void *v3;
  double v4;
  CGFloat v5;
  void *v6;
  CGFloat v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  double Height;
  void *v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  double v23;
  void *v24;
  uint64_t v25;
  CGAffineTransform v26;
  CGAffineTransform v27;
  CGRect v28;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardSetViewController configuration](self, "configuration"));
  objc_msgSend(v3, "cardContractedScale");
  v5 = v4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardSetViewController configuration](self, "configuration"));
  objc_msgSend(v6, "cardContractedScale");
  CGAffineTransformMakeScale(&v27, v5, v7);
  v26 = v27;
  -[BCCardSetViewController setContractedTransform:](self, "setContractedTransform:", &v26);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardSetViewController configuration](self, "configuration"));
  objc_msgSend(v8, "cardUnexpandedTopOffset");
  v10 = v9;
  -[BCCardSetViewController contractedTransform](self, "contractedTransform");
  -[BCCardSetViewController scaleOffset:withTransform:](self, "scaleOffset:withTransform:", &v25, v10);
  v12 = v11;

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardSetViewController scrollView](self, "scrollView"));
  objc_msgSend(v13, "bounds");
  Height = CGRectGetHeight(v28);

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardSetViewController configuration](self, "configuration"));
  objc_msgSend(v15, "cardUnexpandedTopOffset");
  v17 = v16;
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardSetViewController configuration](self, "configuration"));
  objc_msgSend(v18, "cardExpandedTopOffset");
  -[BCCardSetViewController setDistanceToExpand:](self, "setDistanceToExpand:", v17 - v19);

  -[BCCardSetViewController distanceToExpand](self, "distanceToExpand");
  v21 = Height - v20;
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardSetViewController configuration](self, "configuration"));
  objc_msgSend(v22, "cardContractedScale");
  -[BCCardSetViewController setDistanceToDismiss:](self, "setDistanceToDismiss:", v21 / v23);

  -[BCCardSetViewController setScaledContractedOffset:](self, "setScaledContractedOffset:", v12);
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardSetViewController configuration](self, "configuration"));
  objc_msgSend(v24, "cardsCanExpand");

}

- (void)cardTapped:(id)a3
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  void **v8;
  uint64_t v9;
  _QWORD *(*v10)(_QWORD *, void *, uint64_t, _BYTE *);
  void *v11;
  id v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[BCCardSetViewController currentCardViewController](self, "currentCardViewController"));

  if (v5 != v4)
  {
    v14 = 0;
    v15 = &v14;
    v16 = 0x2020000000;
    v17 = 0x7FFFFFFFFFFFFFFFLL;
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardSetViewController displayedCardViewControllers](self, "displayedCardViewControllers"));
    v8 = _NSConcreteStackBlock;
    v9 = 3221225472;
    v10 = sub_4D950;
    v11 = &unk_28D6E8;
    v12 = v4;
    v13 = &v14;
    objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", &v8);

    v7 = v15[3];
    if (v7 != 0x7FFFFFFFFFFFFFFFLL)
      -[BCCardSetViewController setFocusedIndex:animated:](self, "setFocusedIndex:animated:", v7, 1, v8, v9, v10, v11);

    _Block_object_dispose(&v14, 8);
  }

}

- (void)dismissCardStackAnimated:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(-[BCCardSetViewController cardStackViewController](self, "cardStackViewController"));
  objc_msgSend(v4, "popCardsAnimated:", v3);

}

- (void)dismissAllCardsAnimated:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  id v6;
  id v7;

  v4 = a3;
  v6 = a4;
  v7 = (id)objc_claimAutoreleasedReturnValue(-[BCCardSetViewController cardStackViewController](self, "cardStackViewController"));
  objc_msgSend(v7, "popAllCardsAnimated:completion:", v4, v6);

}

- (void)backgroundTapped:(id)a3
{
  if (objc_msgSend(a3, "state") == (char *)&dword_0 + 3)
    -[BCCardSetViewController dismissCardStackAnimated:](self, "dismissCardStackAnimated:", 1);
}

- (void)loadView
{
  BCCardSetView *v3;
  BCCardSetView *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)BCCardSetViewController;
  -[BCCardSetViewController loadView](&v5, "loadView");
  v3 = [BCCardSetView alloc];
  -[BCCardSetViewController initialFrame](self, "initialFrame");
  v4 = -[BCCardSetView initWithFrame:](v3, "initWithFrame:");
  -[BCCardSetView setAutoresizingMask:](v4, "setAutoresizingMask:", 18);
  -[BCCardSetView setAccessibilityDelegate:](v4, "setAccessibilityDelegate:", self);
  -[BCCardSetViewController setView:](self, "setView:", v4);

}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  BCCardSetWideTouchScrollView *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  void *v22;
  __int128 v23;
  void *v24;
  _OWORD v25[3];
  objc_super v26;

  v26.receiver = self;
  v26.super_class = (Class)BCCardSetViewController;
  -[BCCardSetViewController viewDidLoad](&v26, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardSetViewController view](self, "view"));
  objc_msgSend(v4, "setBackgroundColor:", v3);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardSetViewController view](self, "view"));
  objc_msgSend(v5, "setAccessibilityViewIsModal:", 1);

  v6 = objc_msgSend(objc_alloc((Class)UITapGestureRecognizer), "initWithTarget:action:", self, "backgroundTapped:");
  objc_msgSend(v6, "setDelegate:", self);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardSetViewController view](self, "view"));
  objc_msgSend(v7, "addGestureRecognizer:", v6);

  -[BCCardSetViewController setTapToDismissGestureRecognizer:](self, "setTapToDismissGestureRecognizer:", v6);
  v8 = -[BCCardSetWideTouchScrollView initWithFrame:]([BCCardSetWideTouchScrollView alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  -[BCCardSetWideTouchScrollView setAccessibilityDelegate:](v8, "setAccessibilityDelegate:", self);
  -[BCCardSetViewController setScrollView:](self, "setScrollView:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardSetViewController scrollView](self, "scrollView"));
  objc_msgSend(v9, "setPagingEnabled:", 1);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardSetViewController scrollView](self, "scrollView"));
  objc_msgSend(v10, "setClipsToBounds:", 0);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardSetViewController scrollView](self, "scrollView"));
  objc_msgSend(v11, "setShowsHorizontalScrollIndicator:", 0);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardSetViewController scrollView](self, "scrollView"));
  objc_msgSend(v12, "setShowsVerticalScrollIndicator:", 0);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardSetViewController view](self, "view"));
  objc_msgSend(v13, "bounds");
  -[BCCardSetViewController _updateFramesToSize:](self, "_updateFramesToSize:", v14, v15);

  -[BCCardSetViewController _frameForPageAtIndex:](self, "_frameForPageAtIndex:", 0);
  v17 = v16;
  v19 = v18;
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardSetViewController scrollView](self, "scrollView"));
  objc_msgSend(v20, "setContentOffset:animated:", 0, v17, v19);

  v21 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardSetViewController view](self, "view"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardSetViewController scrollView](self, "scrollView"));
  objc_msgSend(v21, "addSubview:", v22);

  v23 = *(_OWORD *)&CGAffineTransformIdentity.c;
  v25[0] = *(_OWORD *)&CGAffineTransformIdentity.a;
  v25[1] = v23;
  v25[2] = *(_OWORD *)&CGAffineTransformIdentity.tx;
  -[BCCardSetViewController setExpandedTransform:](self, "setExpandedTransform:", v25);
  -[BCCardSetViewController updateContractedTransform](self, "updateContractedTransform");
  -[BCCardSetViewController updateCards](self, "updateCards");
  -[BCCardSetViewController goContracted](self, "goContracted");
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardSetViewController scrollView](self, "scrollView"));
  objc_msgSend(v24, "setDelegate:", self);

}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)BCCardSetViewController;
  -[BCCardSetViewController viewDidAppear:](&v4, "viewDidAppear:", a3);
  -[BCCardSetViewController becomeFirstResponder](self, "becomeFirstResponder");
}

- (void)viewWillDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)BCCardSetViewController;
  -[BCCardSetViewController viewWillDisappear:](&v4, "viewWillDisappear:", a3);
  -[BCCardSetViewController resignFirstResponder](self, "resignFirstResponder");
}

- (BOOL)expanded
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardSetViewController currentCardViewController](self, "currentCardViewController"));
  v3 = objc_msgSend(v2, "expanded");

  return v3;
}

- (void)setDataSource:(id)a3
{
  BCCardSetDataSource **p_dataSource;
  id WeakRetained;
  void *v6;
  id obj;

  obj = a3;
  p_dataSource = &self->_dataSource;
  WeakRetained = objc_loadWeakRetained((id *)p_dataSource);

  v6 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)p_dataSource, obj);
    v6 = obj;
  }

}

- (void)setCovered:(BOOL)a3 animated:(BOOL)a4 duration:(double)a5
{
  _BOOL4 v6;
  void *v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unsigned int v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  id v32;
  _QWORD *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  id v41;
  id v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  _QWORD v49[4];
  id v50;
  id v51;
  _QWORD v52[4];
  id v53;
  id v54;
  double v55;
  _QWORD v56[5];
  _QWORD v57[4];
  id v58;
  id v59;
  BCCardSetViewController *v60;
  double v61;
  double v62;
  _QWORD v63[5];
  id v64;
  id v65;
  BOOL v66;

  if (self->_covered != a3)
  {
    v6 = a4;
    self->_covered = a3;
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardSetViewController view](self, "view"));
    objc_msgSend(v8, "bounds");
    v10 = v9;
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardSetViewController scrollView](self, "scrollView"));
    objc_msgSend(v11, "frame");
    v13 = ceil(v10 + floor(v12) * -0.5);
    -[BCCardSetViewController _cardSeparation](self, "_cardSeparation");
    v15 = v14 + v13;

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardSetViewController configuration](self, "configuration"));
    objc_msgSend(v16, "cardContractedScale");
    v18 = v15 / v17;

    v19 = -[BCCardSetViewController cardCount](self, "cardCount");
    v20 = -[BCCardSetViewController currentIndex](self, "currentIndex");
    if (v20 <= 0)
      v21 = 0x7FFFFFFFFFFFFFFFLL;
    else
      v21 = v20 - 1;
    if (v20 + 1 < v19)
      v22 = v20 + 1;
    else
      v22 = 0x7FFFFFFFFFFFFFFFLL;
    v23 = -[BCCardSetViewController _isRTL](self, "_isRTL");
    if (v23)
      v24 = v21;
    else
      v24 = v22;
    if (v23)
      v21 = v22;
    if (self->_covered)
    {
      v25 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardSetViewController displayedCardViewControllers](self, "displayedCardViewControllers"));
      v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v21));
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "objectForKeyedSubscript:", v26));

      v28 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardSetViewController displayedCardViewControllers](self, "displayedCardViewControllers"));
      v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v24));
      v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "objectForKeyedSubscript:", v29));

      v63[0] = _NSConcreteStackBlock;
      v63[1] = 3221225472;
      v63[2] = sub_4E3A4;
      v63[3] = &unk_28D710;
      v63[4] = self;
      v66 = v6;
      v31 = v27;
      v64 = v31;
      v32 = v30;
      v65 = v32;
      v33 = objc_retainBlock(v63);
      if (v6)
      {
        v57[0] = _NSConcreteStackBlock;
        v57[1] = 3221225472;
        v57[2] = sub_4E444;
        v57[3] = &unk_28D738;
        v58 = v31;
        v61 = v18;
        v59 = v32;
        v60 = self;
        v62 = a5;
        +[UIView animateWithDuration:animations:completion:](UIView, "animateWithDuration:animations:completion:", v57, v33, a5);

      }
      else
      {
        v44 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardSetViewController currentCardViewController](self, "currentCardViewController"));
        objc_msgSend(v44, "setScrimAlpha:animated:duration:", 0, 0.2, a5);

        ((void (*)(_QWORD *, uint64_t))v33[2])(v33, 1);
      }

    }
    else
    {
      v56[0] = _NSConcreteStackBlock;
      v56[1] = 3221225472;
      v56[2] = sub_4E50C;
      v56[3] = &unk_28B960;
      v56[4] = self;
      +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v56);
      if (!v6)
      {
        v45 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardSetViewController currentCardViewController](self, "currentCardViewController"));
        objc_msgSend(v45, "setScrimAlpha:animated:duration:", 0, 0.0, a5);

        goto LABEL_22;
      }
      v34 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardSetViewController displayedCardViewControllers](self, "displayedCardViewControllers"));
      v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v21));
      v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "objectForKeyedSubscript:", v35));

      v37 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardSetViewController displayedCardViewControllers](self, "displayedCardViewControllers"));
      v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v24));
      v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "objectForKeyedSubscript:", v38));

      v52[0] = _NSConcreteStackBlock;
      v52[1] = 3221225472;
      v52[2] = sub_4E550;
      v52[3] = &unk_28C9C8;
      v40 = v36;
      v53 = v40;
      v55 = v18;
      v41 = v39;
      v54 = v41;
      +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v52);
      v49[0] = _NSConcreteStackBlock;
      v49[1] = 3221225472;
      v49[2] = sub_4E5F0;
      v49[3] = &unk_28B808;
      v50 = v40;
      v51 = v41;
      v42 = v41;
      v31 = v40;
      +[UIView animateWithDuration:animations:](UIView, "animateWithDuration:animations:", v49, a5);
      v43 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardSetViewController currentCardViewController](self, "currentCardViewController"));
      objc_msgSend(v43, "setScrimAlpha:animated:duration:", 1, 0.0, a5);

    }
LABEL_22:
    v46 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardSetViewController displayedCardViewControllers](self, "displayedCardViewControllers"));
    v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[BCCardSetViewController currentIndex](self, "currentIndex")));
    v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "objectForKeyedSubscript:", v47));

    objc_msgSend(v48, "setIsCurrentCard:", !self->_covered);
  }
}

- (void)didBecomeTopCardSet
{
  void *v3;
  unsigned int v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardSetViewController configuration](self, "configuration"));
  v4 = objc_msgSend(v3, "cardsCanExpand");

  if (v4)
    -[BCCardSetViewController _didBecomeVisibleContentScrollView](self, "_didBecomeVisibleContentScrollView");
}

- (void)_didBecomeVisibleContentScrollView
{
  void *v2;
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[BCCardSetViewController currentCardViewController](self, "currentCardViewController"));
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "topContentViewController"));
  objc_msgSend(v2, "didBecomeVisibleContentScrollView");

}

- (void)setFocusedIndex:(unint64_t)a3
{
  -[BCCardSetViewController setFocusedIndex:animated:](self, "setFocusedIndex:animated:", a3, 0);
}

- (void)setFocusedIndex:(unint64_t)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  void *v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;

  v4 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardSetViewController dataSource](self, "dataSource"));
  if (v7)
  {
    v23 = v7;
    v8 = -[BCCardSetViewController currentIndex](self, "currentIndex");
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardSetViewController scrollStartCardIndex](self, "scrollStartCardIndex"));

    if (!v9 && v4)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v8));
      -[BCCardSetViewController setScrollStartCardIndex:](self, "setScrollStartCardIndex:", v10);

    }
    if ((v8 & 0x8000000000000000) == 0 && v8 != a3)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardSetViewController displayedCardViewControllers](self, "displayedCardViewControllers"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v8));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", v12));

      objc_msgSend(v13, "setIsCurrentCard:", 0);
    }
    v14 = (char *)objc_msgSend(v23, "cardCountForCardSet:", self);
    if ((unint64_t)(v14 - 1) < a3)
      a3 = (unint64_t)(v14 - 1);
    -[BCCardSetViewController _frameForPageAtIndex:](self, "_frameForPageAtIndex:", a3);
    v16 = v15;
    v18 = v17;
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardSetViewController scrollView](self, "scrollView"));
    objc_msgSend(v19, "setContentOffset:animated:", v4, v16, v18);

    -[BCCardSetViewController _updateCurrentIndexIfNeeded](self, "_updateCurrentIndexIfNeeded");
    v7 = v23;
    if (v8 != a3)
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardSetViewController displayedCardViewControllers](self, "displayedCardViewControllers"));
      v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a3));
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "objectForKeyedSubscript:", v21));

      objc_msgSend(v22, "setIsCurrentCard:", -[BCCardSetViewController covered](self, "covered") ^ 1);
      v7 = v23;
    }
  }

}

- (BOOL)itemPushedOnCardAtIndex:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unsigned __int8 v9;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardSetViewController suspendedCardViewControllers](self, "suspendedCardViewControllers"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a3));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", v6));

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardSetViewController cardViewControllerAtIndex:](self, "cardViewControllerAtIndex:", a3));
  if ((objc_msgSend(v7, "itemPushedOnCard") & 1) != 0)
    v9 = 1;
  else
    v9 = objc_msgSend(v8, "itemPushedOnCard");

  return v9;
}

- (void)clearSavedContentOffsetsForCardAtIndex:(unint64_t)a3
{
  void *v4;
  void *v5;
  id v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardSetViewController suspendedCardViewControllers](self, "suspendedCardViewControllers"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a3));
  v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", v5));

  objc_msgSend(v6, "clearSavedContentOffsets");
}

- (void)scrollToTopCardAtIndex:(unint64_t)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardSetViewController suspendedCardViewControllers](self, "suspendedCardViewControllers"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a3));
  v10 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", v8));

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardSetViewController cardViewControllerAtIndex:](self, "cardViewControllerAtIndex:", a3));
  objc_msgSend(v10, "scrollToTop:", 0);
  objc_msgSend(v9, "scrollToTop:", v4);
  -[BCCardSetViewController setScrollToTopVelocity:](self, "setScrollToTopVelocity:", 0.0);

}

- (id)cardViewControllerAtIndex:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardSetViewController displayedCardViewControllers](self, "displayedCardViewControllers"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a3));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", v5));

  return v6;
}

- (void)enumerateAllCardsUsingBlock:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardSetViewController displayedCardViewControllers](self, "displayedCardViewControllers"));
  objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v4);

  v6 = (id)objc_claimAutoreleasedReturnValue(-[BCCardSetViewController suspendedCardViewControllers](self, "suspendedCardViewControllers"));
  objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v4);

}

- (void)cardLayoutDidChange:(BOOL)a3
{
  _BOOL4 v3;
  unint64_t v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  unsigned int v10;
  void *v11;
  unsigned __int8 v12;
  uint64_t v13;
  void *v14;
  void *v15;
  _QWORD block[5];
  _QWORD v17[6];
  char v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  char v22;
  _QWORD v23[4];
  BOOL v24;

  v3 = a3;
  v5 = -[BCCardSetViewController focusedIndex](self, "focusedIndex");
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardSetViewController view](self, "view"));
  objc_msgSend(v6, "bounds");
  -[BCCardSetViewController _updateFramesToSize:](self, "_updateFramesToSize:", v7, v8);

  -[BCCardSetViewController updateContractedTransform](self, "updateContractedTransform");
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardSetViewController dataSource](self, "dataSource"));
  v10 = objc_msgSend(v9, "isTopCardSetViewController:", self);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardSetViewController configuration](self, "configuration"));
  v12 = objc_msgSend(v11, "cardsCanExpand");

  if ((v12 & 1) != 0)
  {
    v19 = 0;
    v20 = &v19;
    v21 = 0x2020000000;
    v22 = 0;
    if (v3)
    {
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_4EE34;
      v17[3] = &unk_28D780;
      v17[4] = self;
      v17[5] = &v19;
      v18 = v10;
      -[BCCardSetViewController enumerateAllCardsUsingBlock:](self, "enumerateAllCardsUsingBlock:", v17);
    }
    if (v10 && !*((_BYTE *)v20 + 24))
    {
      if (v3)
      {
        -[BCCardSetViewController goContracted](self, "goContracted");
      }
      else if (!-[BCCardSetViewController expanded](self, "expanded"))
      {
        -[BCCardSetViewController _goContractedCommon](self, "_goContractedCommon");
      }
    }
    else
    {
      -[BCCardSetViewController goExpanded](self, "goExpanded");
    }
    _Block_object_dispose(&v19, 8);
  }
  else
  {
    -[BCCardSetViewController goContracted](self, "goContracted");
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_4EDEC;
    v23[3] = &unk_28D758;
    v24 = v3;
    -[BCCardSetViewController enumerateAllCardsUsingBlock:](self, "enumerateAllCardsUsingBlock:", v23);
  }
  v13 = -[BCCardSetViewController expanded](self, "expanded") ^ 1;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardSetViewController scrollView](self, "scrollView"));
  objc_msgSend(v14, "setScrollEnabled:", v13);

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardSetViewController currentCardViewController](self, "currentCardViewController"));
  objc_msgSend(v15, "setRawCurrentCardOffset:", 0.0);

  -[BCCardSetViewController updateCards](self, "updateCards");
  -[BCCardSetViewController setFocusedIndex:](self, "setFocusedIndex:", v5);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_4EF5C;
  block[3] = &unk_28B960;
  block[4] = self;
  dispatch_after(0, (dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)willTransitionToTraitCollection:(id)a3 withTransitionCoordinator:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  char *v11;
  char *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  unsigned __int8 v17;
  id v18;
  _QWORD v19[5];
  id v20;
  unsigned __int8 v21;
  _QWORD v22[4];
  id v23;
  char *v24;
  char *v25;
  objc_super v26;

  v6 = a4;
  v26.receiver = self;
  v26.super_class = (Class)BCCardSetViewController;
  v7 = a3;
  -[BCCardSetViewController willTransitionToTraitCollection:withTransitionCoordinator:](&v26, "willTransitionToTraitCollection:withTransitionCoordinator:", v7, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardSetViewController traitCollection](self, "traitCollection"));
  v9 = objc_msgSend(v8, "horizontalSizeClass");
  v10 = objc_msgSend(v7, "horizontalSizeClass");

  if (v9 != v10)
  {
    if (-[BCCardSetViewController currentIndex](self, "currentIndex"))
      v11 = (char *)-[BCCardSetViewController currentIndex](self, "currentIndex") - 1;
    else
      v11 = 0;
    v12 = (char *)-[BCCardSetViewController currentIndex](self, "currentIndex") + 1;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", 2));
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardSetViewController displayedCardViewControllers](self, "displayedCardViewControllers"));
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_4F128;
    v22[3] = &unk_28D7A8;
    v24 = v11;
    v25 = v12;
    v15 = v13;
    v23 = v15;
    objc_msgSend(v14, "enumerateKeysAndObjectsUsingBlock:", v22);

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardSetViewController configuration](self, "configuration"));
    v17 = objc_msgSend(v16, "cardsCanExpand");

    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_4F1B4;
    v19[3] = &unk_28D7D0;
    v19[4] = self;
    v20 = v15;
    v21 = v17;
    v18 = v15;
    objc_msgSend(v6, "animateAlongsideTransition:completion:", 0, v19);

  }
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  _QWORD v8[7];
  objc_super v9;

  height = a3.height;
  width = a3.width;
  v9.receiver = self;
  v9.super_class = (Class)BCCardSetViewController;
  v7 = a4;
  -[BCCardSetViewController viewWillTransitionToSize:withTransitionCoordinator:](&v9, "viewWillTransitionToSize:withTransitionCoordinator:", v7, width, height);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_4F458;
  v8[3] = &unk_28D7F8;
  v8[4] = self;
  *(double *)&v8[5] = width;
  *(double *)&v8[6] = height;
  objc_msgSend(v7, "animateAlongsideTransition:completion:", v8, 0);

}

- (void)viewWillLayoutSubviews
{
  void *v3;
  objc_super v4;
  _QWORD v5[5];

  if (self->_needLayoutCards && !-[BCCardSetViewController isInTransitionUpdateMode](self, "isInTransitionUpdateMode"))
  {
    -[BCCardSetViewController _layoutCards](self, "_layoutCards");
    self->_needLayoutCards = 0;
  }
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardSetViewController displayedCardViewControllers](self, "displayedCardViewControllers"));
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_4F698;
  v5[3] = &unk_28D6C0;
  v5[4] = self;
  objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", v5);

  v4.receiver = self;
  v4.super_class = (Class)BCCardSetViewController;
  -[BCCardSetViewController viewWillLayoutSubviews](&v4, "viewWillLayoutSubviews");
}

- (void)prepareForDismiss
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardSetViewController scrollView](self, "scrollView"));
  objc_msgSend(v3, "_stopScrollingAndZoomingAnimations");

  v4 = (id)objc_claimAutoreleasedReturnValue(-[BCCardSetViewController displayedCardViewControllers](self, "displayedCardViewControllers"));
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", &stru_28D838);

}

- (void)dismissCardSetAnimated
{
  -[BCCardSetViewController dismissCardStackAnimated:](self, "dismissCardStackAnimated:", 1);
}

- (void)goToPreviousCard
{
  -[BCCardSetViewController _goToPreviousCardWithKeyCommand:](self, "_goToPreviousCardWithKeyCommand:", 0);
}

- (void)goToNextCard
{
  -[BCCardSetViewController _goToNextCardWithKeyCommand:](self, "_goToNextCardWithKeyCommand:", 0);
}

- (double)_xOffsetForHiddenSideCardOnLeadingSide:(BOOL)a3
{
  int v3;
  unsigned int v4;
  double result;

  v3 = a3;
  v4 = -[BCCardSetViewController _isRTL](self, "_isRTL");
  result = 50.0;
  if (v4 != v3)
    return -50.0;
  return result;
}

- (double)_cardWidthForContainerWidth:(double)a3 usingConfiguration:(id)a4
{
  id v5;
  double v6;

  v5 = a4;
  if ((objc_msgSend(v5, "cardsCanExpand") & 1) == 0)
  {
    objc_msgSend(v5, "contractedCardWidthForContainerWidth:", a3);
    a3 = v6;
  }

  return a3;
}

- (void)_updateFramesToSize:(CGSize)a3
{
  double height;
  double width;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  double CenterNoRounding;
  double v15;
  double v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  double v27;
  id v28;

  height = a3.height;
  width = a3.width;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardSetViewController configuration](self, "configuration"));
  -[BCCardSetViewController _cardWidthForContainerWidth:usingConfiguration:](self, "_cardWidthForContainerWidth:usingConfiguration:", v6, width);
  v8 = v7;

  -[BCCardSetViewController setCardSize:](self, "setCardSize:", v8, height);
  -[BCCardSetViewController _cardSeparation](self, "_cardSeparation");
  v10 = v8 + v9;
  -[BCCardSetViewController setPagingWidth:](self, "setPagingWidth:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardSetViewController view](self, "view"));
  UIRoundToViewScale((width - v10) * 0.5);

  CGRectMakeWithOriginSize(v12);
  CenterNoRounding = CGRectGetCenterNoRounding(v13);
  v16 = v15;
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardSetViewController scrollView](self, "scrollView"));
  objc_msgSend(v17, "setCenter:", CenterNoRounding, v16);

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardSetViewController scrollView](self, "scrollView"));
  v19 = CGRectMakeWithOriginSize(objc_msgSend(v18, "bounds"));
  v21 = v20;
  v23 = v22;
  v25 = v24;
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardSetViewController scrollView](self, "scrollView"));
  objc_msgSend(v26, "setBounds:", v19, v21, v23, v25);

  v27 = v10 * (double)-[BCCardSetViewController cardCount](self, "cardCount");
  v28 = (id)objc_claimAutoreleasedReturnValue(-[BCCardSetViewController scrollView](self, "scrollView"));
  objc_msgSend(v28, "setContentSize:", v27, height);

}

- (double)_debugDragCoefficient
{
  void *v2;
  unsigned int v3;
  double v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("BCCardStackTransitionAnimatorSlowModeEnabled"));

  if (v3)
    v4 = 3.0;
  else
    v4 = 1.0;
  return v4 * UIAnimationDragCoefficient();
}

- (void)animationCompletedExpanded:(BOOL)a3
{
  _BOOL8 v3;
  _BOOL8 v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  id v11;

  v3 = a3;
  v5 = !a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardSetViewController scrollView](self, "scrollView"));
  objc_msgSend(v6, "setScrollEnabled:", v5);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardSetViewController currentCardViewController](self, "currentCardViewController"));
  v8 = v7;
  if (v5)
    objc_msgSend(v7, "configureChromeForContracted");
  else
    objc_msgSend(v7, "configureChromeForExpanded");

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardSetViewController delegate](self, "delegate"));
  v10 = objc_opt_respondsToSelector(v9, "cardSetViewController:animationCompletedExpanded:");

  if ((v10 & 1) != 0)
  {
    v11 = (id)objc_claimAutoreleasedReturnValue(-[BCCardSetViewController delegate](self, "delegate"));
    objc_msgSend(v11, "cardSetViewController:animationCompletedExpanded:", self, v3);

  }
}

- (void)zoomingAnimationCompletedAtPosition:(int64_t)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[BCCardSetViewController currentCardViewController](self, "currentCardViewController"));
  objc_msgSend(v4, "animationCompletedAtPosition:", a3);

}

- (id)animatorForExpandingTransformingView:(id)a3 duration:(double)a4
{
  return -[BCCardSetViewController animatorForExpandingTransformingView:timingParameter:duration:](self, "animatorForExpandingTransformingView:timingParameter:duration:", a3, 0, a4);
}

- (id)animatorForExpandingTransformingView:(id)a3 timingParameter:(id)a4 duration:(double)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  _QWORD v15[4];
  id v16;
  BCCardSetViewController *v17;

  v8 = a3;
  v9 = a4;
  v10 = objc_alloc((Class)UIViewPropertyAnimator);
  if (v9)
    v11 = objc_msgSend(v10, "initWithDuration:timingParameters:", v9, 0.0);
  else
    v11 = objc_msgSend(v10, "initWithDuration:curve:animations:", 2, 0, a5);
  v12 = v11;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_4FC74;
  v15[3] = &unk_28B808;
  v16 = v8;
  v17 = self;
  v13 = v8;
  objc_msgSend(v12, "addAnimations:", v15);

  return v12;
}

- (void)goExpandedInteractive:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v24[5];
  id v25;
  id v26;
  uint64_t v27;
  char v28;
  _QWORD v29[5];
  id v30;
  _QWORD *v31;
  char v32;
  char v33;
  _QWORD v34[4];
  id v35;
  _QWORD *v36;
  _QWORD v37[5];
  id v38;

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardSetViewController traitCollection](self, "traitCollection"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "traitCollectionByModifyingTraits:", &stru_28D878));

  v6 = isPad();
  if ((v6 & 1) != 0)
  {
    v7 = 0;
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardSetViewController currentCardViewController](self, "currentCardViewController"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "topContentViewController"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "viewIfLoaded"));

  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "backgroundColor"));
  v11 = v10;
  v37[0] = 0;
  v37[1] = v37;
  v37[2] = 0x3032000000;
  v37[3] = sub_5001C;
  v37[4] = sub_5002C;
  v38 = 0;
  if (v10)
  {
    v34[0] = _NSConcreteStackBlock;
    v34[1] = 3221225472;
    v34[2] = sub_50034;
    v34[3] = &unk_28B700;
    v36 = v37;
    v35 = v10;
    objc_msgSend(v23, "performAsCurrentTraitCollection:", v34);

  }
  if (v11)
    v12 = v6 ^ 1;
  else
    v12 = 0;
  v13 = _os_feature_enabled_impl("Books", "unifiedProductPage");
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardSetViewController cardStackViewController](self, "cardStackViewController"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "statusBarBackgroundController"));
  objc_msgSend(v15, "setOpacity:", (double)(v13 ^ 1u));

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardSetViewController scrollView](self, "scrollView"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardSetViewController animatorForExpandingTransformingView:duration:](self, "animatorForExpandingTransformingView:duration:", v16, 0.2));

  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_50084;
  v29[3] = &unk_28D8C8;
  v29[4] = self;
  v32 = v12;
  v18 = v7;
  v30 = v18;
  v31 = v37;
  v33 = v13;
  objc_msgSend(v17, "addAnimations:", v29);
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_5028C;
  v24[3] = &unk_28D8F0;
  v28 = v12;
  v24[4] = self;
  v27 = 0;
  v19 = v18;
  v25 = v19;
  v20 = v11;
  v26 = v20;
  objc_msgSend(v17, "addCompletion:", v24);
  objc_msgSend(v17, "setInterruptible:", 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardSetViewController delegate](self, "delegate"));
  objc_msgSend(v21, "cardSetViewController:animatorForExpanding:", self, v17);

  if (v3)
    objc_msgSend(v17, "pauseAnimation");
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardSetViewController currentCardViewController](self, "currentCardViewController"));
  objc_msgSend(v22, "setAnimator:", v17);

  if (!v3)
    objc_msgSend(v17, "startAnimation");

  _Block_object_dispose(v37, 8);
}

- (void)goContractedInteractive:(BOOL)a3
{
  _BOOL8 v3;
  double v5;
  double v6;
  double v7;

  v3 = a3;
  -[BCCardSetViewController scrollToTopVelocity](self, "scrollToTopVelocity");
  if (v5 == 0.0)
  {
    -[BCCardSetViewController goContractedInteractive:withTiming:](self, "goContractedInteractive:withTiming:", v3, 0);
  }
  else
  {
    -[BCCardSetViewController scrollToTopVelocity](self, "scrollToTopVelocity");
    v7 = v6;
    -[BCCardSetViewController setScrollToTopVelocity:](self, "setScrollToTopVelocity:", 0.0);
    -[BCCardSetViewController goContractedWithBounce:](self, "goContractedWithBounce:", v7);
  }
}

- (void)goContractedWithBounce:(double)a3
{
  double v4;
  double v5;
  id v6;

  v4 = fabs(a3 * 1000000000.0 / 1000000.0);
  -[BCCardSetViewController distanceToExpand](self, "distanceToExpand");
  v6 = objc_msgSend(objc_alloc((Class)UISpringTimingParameters), "initWithMass:stiffness:damping:initialVelocity:", 1.0, 100.0, 80.0, v4 / v5, 0.0);
  -[BCCardSetViewController goContractedInteractive:withTiming:](self, "goContractedInteractive:withTiming:", 1, v6);

}

- (id)animatorForUnexpandingTransformingView:(id)a3 timingParameter:(id)a4 duration:(double)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  _QWORD v16[4];
  id v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _QWORD v21[5];
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;

  v8 = a3;
  v9 = a4;
  v10 = objc_alloc((Class)UIViewPropertyAnimator);
  if (v9)
    v11 = objc_msgSend(v10, "initWithDuration:timingParameters:", v9, 0.0);
  else
    v11 = objc_msgSend(v10, "initWithDuration:curve:animations:", 2, 0, a5);
  v12 = v11;
  v24 = 0u;
  v25 = 0u;
  v23 = 0u;
  if (v8)
    objc_msgSend(v8, "transform");
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_5056C;
  v21[3] = &unk_28B808;
  v21[4] = self;
  v13 = v8;
  v22 = v13;
  objc_msgSend(v12, "addAnimations:", v21);
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_505B4;
  v16[3] = &unk_28D918;
  v18 = v23;
  v19 = v24;
  v20 = v25;
  v17 = v13;
  v14 = v13;
  objc_msgSend(v12, "addCompletion:", v16);

  return v12;
}

- (void)goContractedInteractive:(BOOL)a3 withTiming:(id)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  _QWORD v23[5];
  id v24;
  id v25;
  uint64_t v26;
  char v27;
  _QWORD v28[5];
  id v29;
  _QWORD *v30;
  char v31;
  _QWORD v32[4];
  id v33;
  _QWORD *v34;
  _QWORD v35[5];
  id v36;
  _QWORD v37[6];

  v4 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardSetViewController traitCollection](self, "traitCollection"));
  v37[0] = _NSConcreteStackBlock;
  v37[1] = 3221225472;
  v37[2] = sub_50950;
  v37[3] = &unk_28D938;
  v37[4] = 1;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "traitCollectionByModifyingTraits:", v37));

  v9 = isPad();
  if ((v9 & 1) != 0)
  {
    v10 = 0;
  }
  else
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardSetViewController currentCardViewController](self, "currentCardViewController"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "topContentViewController"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "viewIfLoaded"));

  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "backgroundColor"));
  v14 = v13;
  v35[0] = 0;
  v35[1] = v35;
  v35[2] = 0x3032000000;
  v35[3] = sub_5001C;
  v35[4] = sub_5002C;
  v36 = 0;
  if (v13)
  {
    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472;
    v32[2] = sub_5095C;
    v32[3] = &unk_28B700;
    v34 = v35;
    v33 = v13;
    objc_msgSend(v8, "performAsCurrentTraitCollection:", v32);

  }
  if (v14)
    v15 = v9 ^ 1;
  else
    v15 = 0;
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardSetViewController scrollView](self, "scrollView"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardSetViewController animatorForUnexpandingTransformingView:timingParameter:duration:](self, "animatorForUnexpandingTransformingView:timingParameter:duration:", v16, v6, 0.2));

  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_509AC;
  v28[3] = &unk_28D988;
  v28[4] = self;
  v31 = v15;
  v18 = v10;
  v29 = v18;
  v30 = v35;
  objc_msgSend(v17, "addAnimations:", v28);
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_50BBC;
  v23[3] = &unk_28D8F0;
  v27 = v15;
  v23[4] = self;
  v26 = 1;
  v19 = v18;
  v24 = v19;
  v20 = v14;
  v25 = v20;
  objc_msgSend(v17, "addCompletion:", v23);
  objc_msgSend(v17, "setInterruptible:", 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardSetViewController delegate](self, "delegate"));
  objc_msgSend(v21, "cardSetViewController:animatorForUnexpanding:", self, v17);

  if (v4)
    objc_msgSend(v17, "pauseAnimation");
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardSetViewController currentCardViewController](self, "currentCardViewController"));
  objc_msgSend(v22, "setAnimator:", v17);

  if (!v4)
    objc_msgSend(v17, "startAnimation");

  _Block_object_dispose(v35, 8);
}

- (void)_goContractedCommon
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[BCCardSetViewController scrollView](self, "scrollView"));
  -[BCCardSetViewController _goContractedCommonTransformingView:](self, "_goContractedCommonTransformingView:", v3);

}

- (void)_goContractedCommonTransformingView:(id)a3
{
  id v4;
  _OWORD v5[6];

  v4 = a3;
  -[BCCardSetViewController contractedTransform](self, "contractedTransform");
  v5[0] = v5[3];
  v5[1] = v5[4];
  v5[2] = v5[5];
  objc_msgSend(v4, "setTransform:", v5);

}

- (void)goContracted
{
  id v3;

  -[BCCardSetViewController _goContractedCommon](self, "_goContractedCommon");
  v3 = (id)objc_claimAutoreleasedReturnValue(-[BCCardSetViewController currentCardViewController](self, "currentCardViewController"));
  objc_msgSend(v3, "goContracted");

}

- (void)goExpanded
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[BCCardSetViewController currentCardViewController](self, "currentCardViewController"));
  objc_msgSend(v2, "goExpanded");

}

- (id)animatorForInteractiveDismiss
{
  BCCardStackInteractiveDismissAnimator *v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  void *v9;

  v3 = objc_alloc_init(BCCardStackInteractiveDismissAnimator);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardSetViewController displayedCardViewControllers](self, "displayedCardViewControllers"));
  -[BCCardStackInteractiveDismissAnimator setDisplayedCardViewControllers:](v3, "setDisplayedCardViewControllers:", v4);

  -[BCCardStackInteractiveDismissAnimator setFocusedIndex:](v3, "setFocusedIndex:", -[BCCardSetViewController currentIndex](self, "currentIndex"));
  -[BCCardSetViewController distanceToDismiss](self, "distanceToDismiss");
  -[BCCardStackInteractiveDismissAnimator setMaxSlideDistance:](v3, "setMaxSlideDistance:");
  -[BCCardSetViewController distanceToDismiss](self, "distanceToDismiss");
  v6 = v5;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardSetViewController configuration](self, "configuration"));
  objc_msgSend(v7, "cardContractedScale");
  -[BCCardStackInteractiveDismissAnimator setMaxTitleSlideDistance:](v3, "setMaxTitleSlideDistance:", v6 * v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardSetViewController delegate](self, "delegate"));
  objc_msgSend(v9, "cardSetViewController:animatorForInteractiveDismiss:", self, v3);

  -[BCCardStackInteractiveDismissAnimator setupForInteractiveDismiss](v3, "setupForInteractiveDismiss");
  return v3;
}

- (void)scrollCurrentCardToTop
{
  void *v3;
  double v4;
  double v5;
  double v6;
  id v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardSetViewController currentCardViewController](self, "currentCardViewController"));
  v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "scrollView"));

  objc_msgSend(v7, "contentOffset");
  v5 = v4;
  objc_msgSend(v7, "adjustedContentInset");
  -[BCCardSetViewController setScrollToTopVelocity:](self, "setScrollToTopVelocity:", (v5 + v6) / 300.0);
  -[BCCardSetViewController scrollToTopCardAtIndex:animated:](self, "scrollToTopCardAtIndex:animated:", -[BCCardSetViewController focusedIndex](self, "focusedIndex"), 1);

}

- (id)accessibilityScrollStatusForWideTouchScrollView:(id)a3
{
  NSMutableArray *v4;
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  unint64_t v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v4 = objc_opt_new(NSMutableArray);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardSetViewController currentCardViewController](self, "currentCardViewController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "topContentViewController"));

  if ((objc_opt_respondsToSelector(v6, "accessibilityCardContentSummary") & 1) != 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "accessibilityCardContentSummary"));
    if (objc_msgSend(v7, "length"))
      -[NSMutableArray addObject:](v4, "addObject:", v7);

  }
  v8 = -[BCCardSetViewController currentIndex](self, "currentIndex");
  v9 = -[BCCardSetViewController cardCount](self, "cardCount");
  v10 = IMCommonCoreBundle();
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("%1$lu of %2$lu"), &stru_296430, CFSTR("BCCommonCoreLocalizable")));

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v12, v8 + 1, v9));
  -[NSMutableArray addObject:](v4, "addObject:", v13);

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray componentsJoinedByString:](v4, "componentsJoinedByString:", CFSTR(", ")));
  return v14;
}

- (BOOL)accessibilityDismissCardSetView:(id)a3
{
  -[BCCardSetViewController dismissCardStackAnimated:](self, "dismissCardStackAnimated:", 0);
  return 1;
}

- (id)additionalAccessibilityElementsForCardSetView
{
  return &__NSArray0__struct;
}

- (BOOL)_isRTL
{
  return objc_msgSend(UIApp, "userInterfaceLayoutDirection") == (char *)&dword_0 + 1;
}

- (double)_flipScrollViewOffsetIfNeeded:(double)a3 width:(double)a4
{
  void *v7;
  double v8;

  if (-[BCCardSetViewController _isRTL](self, "_isRTL"))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardSetViewController scrollView](self, "scrollView"));
    objc_msgSend(v7, "contentSize");
    a3 = v8 - a3 - a4;

  }
  return a3;
}

- (CGRect)_frameForPageAtIndex:(int64_t)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  CGFloat Height;
  double v14;
  double v15;
  double v16;
  double v17;
  CGRect v18;
  CGRect result;

  -[BCCardSetViewController pagingWidth](self, "pagingWidth");
  v6 = v5 * (double)a3;
  -[BCCardSetViewController pagingWidth](self, "pagingWidth");
  -[BCCardSetViewController _flipScrollViewOffsetIfNeeded:width:](self, "_flipScrollViewOffsetIfNeeded:width:", v6, v7);
  v9 = v8;
  -[BCCardSetViewController pagingWidth](self, "pagingWidth");
  v11 = v10;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardSetViewController view](self, "view"));
  objc_msgSend(v12, "bounds");
  Height = CGRectGetHeight(v18);

  v14 = 0.0;
  v15 = v9;
  v16 = v11;
  v17 = Height;
  result.size.height = v17;
  result.size.width = v16;
  result.origin.y = v14;
  result.origin.x = v15;
  return result;
}

- (CGRect)_frameForCardAtIndex:(int64_t)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGRect result;

  -[BCCardSetViewController cardSize](self, "cardSize");
  v6 = v5;
  -[BCCardSetViewController pagingWidth](self, "pagingWidth");
  v8 = v7;
  -[BCCardSetViewController _cardSeparation](self, "_cardSeparation");
  v10 = CGRectMakeWithOriginSize(-[BCCardSetViewController _flipScrollViewOffsetIfNeeded:width:](self, "_flipScrollViewOffsetIfNeeded:width:", v9 * 0.5 + (double)a3 * v8, v6));
  result.size.height = v13;
  result.size.width = v12;
  result.origin.y = v11;
  result.origin.x = v10;
  return result;
}

- (CGRect)frameForCardAtIndex:(int64_t)a3 inCoordinatesOfCardAtIndex:(int64_t)a4
{
  double v5;
  double v6;
  double v7;
  double v8;
  CGRect result;

  -[BCCardSetViewController cardSize](self, "cardSize");
  -[BCCardSetViewController _isRTL](self, "_isRTL");
  v5 = CGRectMakeWithOriginSize(-[BCCardSetViewController pagingWidth](self, "pagingWidth"));
  result.size.height = v8;
  result.size.width = v7;
  result.origin.y = v6;
  result.origin.x = v5;
  return result;
}

- (int64_t)_currentIndexFromScrollViewBounds
{
  void *v3;
  unint64_t v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  uint64_t v10;
  int64_t v11;
  uint64_t v12;
  int64_t v13;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardSetViewController dataSource](self, "dataSource"));

  if (!v3)
    return 0x7FFFFFFFFFFFFFFFLL;
  v4 = -[BCCardSetViewController cardCount](self, "cardCount");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardSetViewController scrollView](self, "scrollView"));
  objc_msgSend(v5, "bounds");
  v7 = v6;
  v9 = v8;

  v10 = vcvtmd_s64_f64(v7 / v9 + 0.5);
  v11 = v4 - 1;
  v12 = v10 & ~(v10 >> 63);
  if (v11 >= v12)
    v13 = v12;
  else
    v13 = v11;
  if (-[BCCardSetViewController _isRTL](self, "_isRTL"))
    return v11 - v13;
  else
    return v13;
}

- (void)_updateCurrentIndexIfNeeded
{
  double MinX;
  void *v4;
  double v5;
  double v6;
  int8x16_t v7;
  double v8;
  double v9;
  unint64_t v10;
  int8x16_t v11;
  float64x2_t v12;
  void *v13;
  void *v14;
  void *v15;
  unint64_t v16;
  unint64_t v17;
  void *v18;
  void *v19;
  unsigned int v20;
  uint64_t v21;
  int8x16_t v22;
  id v23;
  CGRect v24;

  -[BCCardSetViewController _frameForPageAtIndex:](self, "_frameForPageAtIndex:", -[BCCardSetViewController currentIndex](self, "currentIndex"));
  MinX = CGRectGetMinX(v24);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardSetViewController scrollView](self, "scrollView"));
  objc_msgSend(v4, "contentOffset");
  v6 = v5;
  *(double *)v7.i64 = v5 - MinX;
  v22 = v7;

  -[BCCardSetViewController pagingWidth](self, "pagingWidth");
  v9 = vabdd_f64(v6, MinX) / v8;
  v23 = (id)objc_claimAutoreleasedReturnValue(-[BCCardSetViewController cardViewControllerAtIndex:](self, "cardViewControllerAtIndex:", -[BCCardSetViewController currentIndex](self, "currentIndex")));
  v10 = -[BCCardSetViewController currentIndex](self, "currentIndex");
  v11.i64[0] = 1.0;
  v12.f64[0] = NAN;
  v12.f64[1] = NAN;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardSetViewController cardViewControllerAtIndex:](self, "cardViewControllerAtIndex:", (uint64_t)(*(double *)vbslq_s8((int8x16_t)vnegq_f64(v12), v11, v22).i64 + (double)v10)));
  if ((objc_msgSend(v23, "itemPushedOnCard") & 1) == 0)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "auxiliaryNavigationBarView"));
    objc_msgSend(v14, "setAlpha:", 1.0 - v9);

  }
  if ((objc_msgSend(v13, "itemPushedOnCard", *(_OWORD *)&v22) & 1) == 0)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "auxiliaryNavigationBarView"));
    objc_msgSend(v15, "setAlpha:", v9);

  }
  v16 = -[BCCardSetViewController _currentIndexFromScrollViewBounds](self, "_currentIndexFromScrollViewBounds");
  v17 = -[BCCardSetViewController currentIndex](self, "currentIndex");
  if (v16 != 0x7FFFFFFFFFFFFFFFLL && v17 != v16)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardSetViewController scrollView](self, "scrollView"));
    if (objc_msgSend(v18, "isTracking"))
    {

    }
    else
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardSetViewController scrollView](self, "scrollView"));
      v20 = objc_msgSend(v19, "isDragging");

      if (!v20)
        goto LABEL_15;
    }
    if (-[BCCardSetViewController currentIndex](self, "currentIndex") < v16)
    {
      v21 = 3;
LABEL_14:
      -[BCCardSetViewController setLastNavigationType:](self, "setLastNavigationType:", v21);
      goto LABEL_15;
    }
    if (-[BCCardSetViewController currentIndex](self, "currentIndex") > v16)
    {
      v21 = 2;
      goto LABEL_14;
    }
LABEL_15:
    -[BCCardSetViewController updateCards](self, "updateCards");
  }

}

- (BCStatusBarBackgroundController)statusBarBackgroundController
{
  return self->_statusBarBackgroundController;
}

- (void)updateCards
{
  id v2;

  if (!self->_needLayoutCards)
  {
    self->_needLayoutCards = 1;
    v2 = (id)objc_claimAutoreleasedReturnValue(-[BCCardSetViewController view](self, "view"));
    objc_msgSend(v2, "setNeedsLayout");

  }
}

- (void)updateWithAppendedCards
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;

  if (-[BCCardSetViewController isInTransitionUpdateMode](self, "isInTransitionUpdateMode"))
  {
    -[BCCardSetViewController setCardsAppendedDuringTransition:](self, "setCardsAppendedDuringTransition:", 1);
  }
  else
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardSetViewController view](self, "view"));
    objc_msgSend(v3, "bounds");
    -[BCCardSetViewController _updateFramesToSize:](self, "_updateFramesToSize:", v4, v5);

    -[BCCardSetViewController _frameForPageAtIndex:](self, "_frameForPageAtIndex:", -[BCCardSetViewController currentIndex](self, "currentIndex"));
    v7 = v6;
    v9 = v8;
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardSetViewController scrollView](self, "scrollView"));
    objc_msgSend(v10, "setContentOffset:animated:", 0, v7, v9);

    -[BCCardSetViewController _updateCurrentIndexIfNeeded](self, "_updateCurrentIndexIfNeeded");
    -[BCCardSetViewController updateCards](self, "updateCards");
  }
}

- (void)_layoutCards
{
  void *v3;
  int64_t v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  id WeakRetained;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  BCCardSetViewController *v17;
  id v18;
  int64_t v19;
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;
  BCCardSetViewController *v24;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardSetViewController dataSource](self, "dataSource"));
  if (v3)
  {
    v14 = v3;
    objc_msgSend(v3, "cardCountForCardSet:", self);
    v4 = -[BCCardSetViewController _currentIndexFromScrollViewBounds](self, "_currentIndexFromScrollViewBounds");
    -[BCCardSetViewController setCurrentIndex:](self, "setCurrentIndex:", v4);
    if (!-[BCCardSetViewController covered](self, "covered"))
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardSetViewController configuration](self, "configuration"));
      objc_msgSend(v5, "cardBufferCount");

    }
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexSet indexSetWithIndexesInRange:](NSIndexSet, "indexSetWithIndexesInRange:"));
    v7 = objc_alloc_init((Class)NSMutableDictionary);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardSetViewController displayedCardViewControllers](self, "displayedCardViewControllers"));
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_517B4;
    v21[3] = &unk_28D9B0;
    v22 = v6;
    v9 = v7;
    v23 = v9;
    v24 = self;
    v10 = v6;
    objc_msgSend(v8, "enumerateKeysAndObjectsUsingBlock:", v21);

    WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
    v12 = objc_msgSend(WeakRetained, "cardNavigationControllerForCardSet:", self);

    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_518E0;
    v15[3] = &unk_28D9D8;
    v16 = v9;
    v17 = self;
    v19 = v4;
    v20 = v12;
    v18 = v14;
    v13 = v9;
    objc_msgSend(v10, "enumerateIndexesUsingBlock:", v15);
    -[BCCardSetViewController setDisplayedCardViewControllers:](self, "setDisplayedCardViewControllers:", v13);

    v3 = v14;
  }

}

- (_NSRange)_visibleCardRangePassingTest:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void ***v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  NSUInteger v19;
  NSUInteger v20;
  void **v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void *v24;
  BCCardSetViewController *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  _NSRange result;

  v4 = a3;
  v5 = -[BCCardSetViewController cardCount](self, "cardCount");
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardSetViewController view](self, "view"));
    objc_msgSend(v6, "bounds");
    v8 = v7;
    v10 = v9;
    v12 = v11;
    v14 = v13;

    v21 = _NSConcreteStackBlock;
    v22 = 3221225472;
    v23 = sub_52148;
    v24 = &unk_28DA00;
    v25 = self;
    v27 = v8;
    v28 = v10;
    v29 = v12;
    v30 = v14;
    v26 = v4;
    v15 = objc_retainBlock(&v21);
    v16 = (uint64_t)-[BCCardSetViewController currentIndex](self, "currentIndex", v21, v22, v23, v24, v25) + 1;
    while (1)
    {
      v17 = v16 - 2;
      if (v16 - 2 < 0)
        break;
      --v16;
      if ((((uint64_t (*)(void ***, uint64_t))v15[2])(v15, v17) & 1) == 0)
        goto LABEL_8;
    }
    v16 = 0;
LABEL_8:
    v18 = (char *)-[BCCardSetViewController currentIndex](self, "currentIndex") - 1;
    while ((uint64_t)(v18 + 2) < v5)
    {
      ++v18;
      if ((((uint64_t (*)(void ***))v15[2])(v15) & 1) == 0)
        goto LABEL_13;
    }
    v18 = (char *)(v5 - 1);
LABEL_13:
    v5 = (uint64_t)&v18[-v16 + 1];

  }
  else
  {
    v16 = 0x7FFFFFFFFFFFFFFFLL;
  }

  v19 = v16;
  v20 = v5;
  result.length = v20;
  result.location = v19;
  return result;
}

- (_NSRange)visibleCardRange
{
  id v2;
  NSUInteger v3;
  _NSRange result;

  v2 = -[BCCardSetViewController _visibleCardRangePassingTest:](self, "_visibleCardRangePassingTest:", &stru_28DA40);
  result.length = v3;
  result.location = (NSUInteger)v2;
  return result;
}

- (void)beginTransitionUpdateModeForCardsAtRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  id v6;
  _QWORD v7[6];

  length = a3.length;
  location = a3.location;
  -[BCCardSetViewController setIsInTransitionUpdateMode:](self, "setIsInTransitionUpdateMode:", 1);
  v6 = (id)objc_claimAutoreleasedReturnValue(-[BCCardSetViewController displayedCardViewControllers](self, "displayedCardViewControllers"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_522C4;
  v7[3] = &unk_28DA60;
  v7[4] = location;
  v7[5] = length;
  objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v7);

}

- (void)endTransitionUpdateMode
{
  void *v3;

  -[BCCardSetViewController setIsInTransitionUpdateMode:](self, "setIsInTransitionUpdateMode:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardSetViewController displayedCardViewControllers](self, "displayedCardViewControllers"));
  objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", &stru_28DA80);

  if (-[BCCardSetViewController cardsAppendedDuringTransition](self, "cardsAppendedDuringTransition"))
  {
    -[BCCardSetViewController updateWithAppendedCards](self, "updateWithAppendedCards");
    -[BCCardSetViewController setCardsAppendedDuringTransition:](self, "setCardsAppendedDuringTransition:", 0);
  }
}

- (void)presentationTransitionDidComplete
{
  if (!self->_isPresentationTransitionCompleted)
  {
    self->_isPresentationTransitionCompleted = 1;
    -[BCCardSetViewController enumerateAllCardsUsingBlock:](self, "enumerateAllCardsUsingBlock:", &stru_28DAA0);
  }
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  id v4;
  id v5;
  void *v6;
  unint64_t v7;
  void *v8;
  id v9;
  void *v10;

  v4 = a3;
  kdebug_trace(725354456, 0, 0, 0, 0);
  v5 = (id)objc_claimAutoreleasedReturnValue(-[BCCardSetViewController scrollView](self, "scrollView"));

  if (v5 == v4)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMapTable strongToStrongObjectsMapTable](NSMapTable, "strongToStrongObjectsMapTable"));
    -[BCCardSetViewController setScrollingAssertions:](self, "setScrollingAssertions:", v6);

    v7 = -[BCCardSetViewController currentIndex](self, "currentIndex");
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardSetViewController scrollStartCardIndex](self, "scrollStartCardIndex"));
    v9 = objc_msgSend(v8, "integerValue");

    if (v9 != (id)v7)
      sub_52500(self);
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v7));
    -[BCCardSetViewController setScrollStartCardIndex:](self, "setScrollStartCardIndex:", v10);

    -[BCCardSetViewController setIsDragging:](self, "setIsDragging:", 1);
  }
}

- (void)scrollViewDidScroll:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[BCCardSetViewController scrollView](self, "scrollView"));

  if (v5 == v4)
    -[BCCardSetViewController _updateCurrentIndexIfNeeded](self, "_updateCurrentIndexIfNeeded");
}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  id v6;
  id v7;

  v6 = a3;
  v7 = (id)objc_claimAutoreleasedReturnValue(-[BCCardSetViewController scrollView](self, "scrollView"));

  if (v7 == v6)
  {
    sub_52500(self);
    if (!a4)
      -[BCCardSetViewController _scrollViewDidEndScrolling](self, "_scrollViewDidEndScrolling");
  }
}

- (void)scrollViewDidEndDecelerating:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[BCCardSetViewController scrollView](self, "scrollView"));

  if (v5 == v4)
    -[BCCardSetViewController _scrollViewDidEndScrolling](self, "_scrollViewDidEndScrolling");
}

- (void)scrollViewDidEndScrollingAnimation:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[BCCardSetViewController scrollView](self, "scrollView"));

  if (v5 == v4)
    -[BCCardSetViewController _scrollViewDidEndScrolling](self, "_scrollViewDidEndScrolling");
}

- (void)_scrollViewDidEndScrolling
{
  void *v3;

  kdebug_trace(725354460, 0, 0, 0, 0);
  sub_52500(self);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardSetViewController scrollStartCardIndex](self, "scrollStartCardIndex"));

  if (v3)
  {
    -[BCCardSetViewController setScrollingAssertions:](self, "setScrollingAssertions:", 0);
    -[BCCardSetViewController setScrollStartCardIndex:](self, "setScrollStartCardIndex:", 0);
  }
  -[BCCardSetViewController setIsDragging:](self, "setIsDragging:", 0);
}

- (id)im_visibleChildViewControllers
{
  unint64_t v3;
  unint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  void *i;
  id v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];

  v3 = -[BCCardSetViewController currentIndex](self, "currentIndex");
  if (v3 == -1)
    return &__NSArray0__struct;
  v4 = v3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardSetViewController displayedCardViewControllers](self, "displayedCardViewControllers"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v4));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", v6));

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardSetViewController displayedCardViewControllers](self, "displayedCardViewControllers"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(v8, "count")));

  objc_msgSend(v9, "addObject:", v7);
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardSetViewController displayedCardViewControllers](self, "displayedCardViewControllers", 0));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "allValues"));

  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(_QWORD *)v19 != v14)
          objc_enumerationMutation(v11);
        if (*(void **)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)i) != v7)
          objc_msgSend(v9, "addObject:");
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v13);
  }

  v16 = objc_msgSend(v9, "copy");
  return v16;
}

- (BOOL)bc_analyticsVisibilityOfChild:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[BCCardSetViewController currentCardViewController](self, "currentCardViewController"));

  return v5 == v4;
}

- (void)cardViewControllerDidTapCard:(id)a3
{
  -[BCCardSetViewController cardTapped:](self, "cardTapped:", a3);
}

- (void)cardViewControllerDidTapScrollView:(id)a3
{
  -[BCCardSetViewController dismissCardStackAnimated:](self, "dismissCardStackAnimated:", 1);
}

- (BOOL)cardViewControllerCanCloseAsset:(id)a3
{
  void *v3;
  unsigned __int8 v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardSetViewController presentingViewController](self, "presentingViewController", a3));
  v4 = objc_msgSend(v3, "bc_canCloseAsset");

  return v4;
}

- (void)cardViewControllerDidTapCloseAllCards:(id)a3
{
  void *v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(-[BCCardSetViewController presentingViewController](self, "presentingViewController", a3));
  if (objc_msgSend(v5, "bc_canCloseAsset"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardSetViewController cardStackViewController](self, "cardStackViewController"));
    objc_msgSend(v5, "bc_closeToAssetWithCardStackViewController:completion:", v4, &stru_28DAC0);

  }
  else
  {
    -[BCCardSetViewController dismissAllCardsAnimated:completion:](self, "dismissAllCardsAnimated:completion:", 1, 0);
  }

}

- (void)cardViewControllerDidTapCloseAsset:(id)a3
{
  void *v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(-[BCCardSetViewController presentingViewController](self, "presentingViewController", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardSetViewController cardStackViewController](self, "cardStackViewController"));
  objc_msgSend(v5, "bc_closeAssetWithCardStackViewController:completion:", v4, &stru_28DAE0);

}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "view"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardSetViewController view](self, "view"));
  if (v6 == v7)
  {
    v10 = 1;
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "view"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardSetViewController scrollView](self, "scrollView"));
    v10 = v8 == v9;

  }
  return v10;
}

- (void)edgePanGesture:(id)a3
{
  void *v4;
  double v5;
  double v6;
  void *v7;
  double Width;
  double v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  id v19;
  CGRect v20;

  v19 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "view"));
  objc_msgSend(v19, "translationInView:", v4);
  v6 = v5;

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "view"));
  objc_msgSend(v7, "bounds");
  Width = CGRectGetWidth(v20);

  v9 = v6 / Width;
  switch((unint64_t)objc_msgSend(v19, "state"))
  {
    case 1uLL:
      v10 = objc_alloc_init((Class)UIPercentDrivenInteractiveTransition);
      -[BCCardSetViewController setPercentDrivenInteractiveTransition:](self, "setPercentDrivenInteractiveTransition:", v10);

      v11 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardSetViewController currentCardViewController](self, "currentCardViewController"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "cardNavigationController"));
      v13 = objc_msgSend(v12, "popViewControllerAnimated:", 1);

      goto LABEL_7;
    case 2uLL:
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardSetViewController percentDrivenInteractiveTransition](self, "percentDrivenInteractiveTransition"));
      objc_msgSend(v11, "updateInteractiveTransition:", v9);
LABEL_7:

      break;
    case 3uLL:
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "view"));
      objc_msgSend(v19, "velocityInView:", v14);
      v16 = v15;

      v17 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardSetViewController percentDrivenInteractiveTransition](self, "percentDrivenInteractiveTransition"));
      v18 = v17;
      if (v9 <= 0.5 && v16 <= 0.0)
        goto LABEL_9;
      objc_msgSend(v17, "finishInteractiveTransition");
      goto LABEL_11;
    case 4uLL:
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardSetViewController percentDrivenInteractiveTransition](self, "percentDrivenInteractiveTransition"));
      v18 = v17;
LABEL_9:
      objc_msgSend(v17, "cancelInteractiveTransition");
LABEL_11:

      -[BCCardSetViewController setPercentDrivenInteractiveTransition:](self, "setPercentDrivenInteractiveTransition:", 0);
      break;
    default:
      break;
  }

}

- (void)_didCommitDismissWithVelocity:(double)a3 interactiveAnimator:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  v7 = (id)objc_claimAutoreleasedReturnValue(-[BCCardSetViewController delegate](self, "delegate"));
  objc_msgSend(v7, "cardSetViewController:didCommitDismissWithVelocity:interactiveAnimator:", self, v6, a3);

}

- (void)suspendAndTeardownForReason:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardSetViewController displayedCardViewControllers](self, "displayedCardViewControllers"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_52F2C;
  v7[3] = &unk_28D6C0;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v7);

}

- (void)resumeAndRebuildForReason:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardSetViewController displayedCardViewControllers](self, "displayedCardViewControllers"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_52FCC;
  v7[3] = &unk_28D6C0;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v7);

}

- (id)keyCommands
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[2];

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIKeyCommand keyCommandWithInput:modifierFlags:action:](UIKeyCommand, "keyCommandWithInput:modifierFlags:action:", UIKeyInputLeftArrow, 0x100000, "_goToPreviousCardWithKeyCommand:"));
  objc_msgSend(v2, "setAllowsAutomaticMirroring:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIKeyCommand keyCommandWithInput:modifierFlags:action:](UIKeyCommand, "keyCommandWithInput:modifierFlags:action:", UIKeyInputRightArrow, 0x100000, "_goToNextCardWithKeyCommand:"));
  objc_msgSend(v3, "setAllowsAutomaticMirroring:", 1);
  v6[0] = v2;
  v6[1] = v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v6, 2));

  return v4;
}

- (void)_goToPreviousCardWithKeyCommand:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v4 = -[BCCardSetViewController currentIndex](self, "currentIndex", a3);
  v5 = v4 - 1;
  if (v4 >= 1)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardSetViewController scrollStartCardIndex](self, "scrollStartCardIndex"));

    if (!v6)
      -[BCCardSetViewController setFocusedIndex:animated:](self, "setFocusedIndex:animated:", v5, 1);
  }
}

- (void)_goToNextCardWithKeyCommand:(id)a3
{
  char *v4;
  void *v5;

  v4 = (char *)-[BCCardSetViewController currentIndex](self, "currentIndex", a3) + 1;
  if (v4 < (char *)-[BCCardSetViewController cardCount](self, "cardCount"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardSetViewController scrollStartCardIndex](self, "scrollStartCardIndex"));

    if (!v5)
      -[BCCardSetViewController setFocusedIndex:animated:](self, "setFocusedIndex:animated:", v4, 1);
  }
}

- (double)scrollToTopVelocity
{
  return self->_scrollToTopVelocity;
}

- (void)setScrollToTopVelocity:(double)a3
{
  self->_scrollToTopVelocity = a3;
}

- (UIView)navigationSkrimView
{
  return self->_navigationSkrimView;
}

- (void)setNavigationSkrimView:(id)a3
{
  objc_storeStrong((id *)&self->_navigationSkrimView, a3);
}

- (CGAffineTransform)expandedTransform
{
  __int128 v3;

  v3 = *(_OWORD *)&self[7].b;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[6].ty;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&self[7].d;
  return self;
}

- (void)setExpandedTransform:(CGAffineTransform *)a3
{
  __int128 v3;
  __int128 v4;

  v4 = *(_OWORD *)&a3->c;
  v3 = *(_OWORD *)&a3->tx;
  *(_OWORD *)&self->_expandedTransform.a = *(_OWORD *)&a3->a;
  *(_OWORD *)&self->_expandedTransform.c = v4;
  *(_OWORD *)&self->_expandedTransform.tx = v3;
}

- (UIPercentDrivenInteractiveTransition)percentDrivenInteractiveTransition
{
  return self->_percentDrivenInteractiveTransition;
}

- (void)setPercentDrivenInteractiveTransition:(id)a3
{
  objc_storeStrong((id *)&self->_percentDrivenInteractiveTransition, a3);
}

- (UITapGestureRecognizer)tapToDismissGestureRecognizer
{
  return self->_tapToDismissGestureRecognizer;
}

- (void)setTapToDismissGestureRecognizer:(id)a3
{
  self->_tapToDismissGestureRecognizer = (UITapGestureRecognizer *)a3;
}

- (UIScrollView)scrollView
{
  return self->_scrollView;
}

- (void)setScrollView:(id)a3
{
  objc_storeStrong((id *)&self->_scrollView, a3);
}

- (CGAffineTransform)contractedTransform
{
  __int128 v3;

  v3 = *(_OWORD *)&self[8].b;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[7].ty;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&self[8].d;
  return self;
}

- (void)setContractedTransform:(CGAffineTransform *)a3
{
  __int128 v3;
  __int128 v4;

  v4 = *(_OWORD *)&a3->c;
  v3 = *(_OWORD *)&a3->tx;
  *(_OWORD *)&self->_contractedTransform.a = *(_OWORD *)&a3->a;
  *(_OWORD *)&self->_contractedTransform.c = v4;
  *(_OWORD *)&self->_contractedTransform.tx = v3;
}

- (BOOL)isInTransitionUpdateMode
{
  return self->_isInTransitionUpdateMode;
}

- (void)setIsInTransitionUpdateMode:(BOOL)a3
{
  self->_isInTransitionUpdateMode = a3;
}

- (BOOL)covered
{
  return self->_covered;
}

- (void)setCovered:(BOOL)a3
{
  self->_covered = a3;
}

- (UIScreenEdgePanGestureRecognizer)edgePanGestureRecognizer
{
  return self->_edgePanGestureRecognizer;
}

- (void)setEdgePanGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_edgePanGestureRecognizer, a3);
}

- (BCCardSetDataSource)dataSource
{
  return (BCCardSetDataSource *)objc_loadWeakRetained((id *)&self->_dataSource);
}

- (BCCardSetDelegate)delegate
{
  return (BCCardSetDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BCCardStackConfiguration)configuration
{
  return (BCCardStackConfiguration *)objc_loadWeakRetained((id *)&self->_configuration);
}

- (void)setConfiguration:(id)a3
{
  objc_storeWeak((id *)&self->_configuration, a3);
}

- (UIEdgeInsets)contentInset
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_contentInset.top;
  left = self->_contentInset.left;
  bottom = self->_contentInset.bottom;
  right = self->_contentInset.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (double)scaledContractedOffset
{
  return self->_scaledContractedOffset;
}

- (void)setScaledContractedOffset:(double)a3
{
  self->_scaledContractedOffset = a3;
}

- (CGRect)initialFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_initialFrame.origin.x;
  y = self->_initialFrame.origin.y;
  width = self->_initialFrame.size.width;
  height = self->_initialFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setInitialFrame:(CGRect)a3
{
  self->_initialFrame = a3;
}

- (NSMutableDictionary)displayedCardViewControllers
{
  return self->_displayedCardViewControllers;
}

- (void)setDisplayedCardViewControllers:(id)a3
{
  objc_storeStrong((id *)&self->_displayedCardViewControllers, a3);
}

- (NSMutableDictionary)suspendedCardViewControllers
{
  return self->_suspendedCardViewControllers;
}

- (void)setSuspendedCardViewControllers:(id)a3
{
  objc_storeStrong((id *)&self->_suspendedCardViewControllers, a3);
}

- (unint64_t)currentIndex
{
  return self->_currentIndex;
}

- (void)setCurrentIndex:(unint64_t)a3
{
  self->_currentIndex = a3;
}

- (double)pagingWidth
{
  return self->_pagingWidth;
}

- (void)setPagingWidth:(double)a3
{
  self->_pagingWidth = a3;
}

- (double)distanceToDismiss
{
  return self->_distanceToDismiss;
}

- (void)setDistanceToDismiss:(double)a3
{
  self->_distanceToDismiss = a3;
}

- (id)endExpandedBlock
{
  return self->_endExpandedBlock;
}

- (void)setEndExpandedBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (double)distanceToExpand
{
  return self->_distanceToExpand;
}

- (void)setDistanceToExpand:(double)a3
{
  self->_distanceToExpand = a3;
}

- (NSMapTable)scrollingAssertions
{
  return self->_scrollingAssertions;
}

- (void)setScrollingAssertions:(id)a3
{
  objc_storeStrong((id *)&self->_scrollingAssertions, a3);
}

- (NSMapTable)suspendedCardsScrollingAssertions
{
  return self->_suspendedCardsScrollingAssertions;
}

- (void)setSuspendedCardsScrollingAssertions:(id)a3
{
  objc_storeStrong((id *)&self->_suspendedCardsScrollingAssertions, a3);
}

- (BOOL)needLayoutCards
{
  return self->_needLayoutCards;
}

- (void)setNeedLayoutCards:(BOOL)a3
{
  self->_needLayoutCards = a3;
}

- (BOOL)cardsAppendedDuringTransition
{
  return self->_cardsAppendedDuringTransition;
}

- (void)setCardsAppendedDuringTransition:(BOOL)a3
{
  self->_cardsAppendedDuringTransition = a3;
}

- (BOOL)isDragging
{
  return self->_isDragging;
}

- (void)setIsDragging:(BOOL)a3
{
  self->_isDragging = a3;
}

- (NSNumber)scrollStartCardIndex
{
  return self->_scrollStartCardIndex;
}

- (void)setScrollStartCardIndex:(id)a3
{
  objc_storeStrong((id *)&self->_scrollStartCardIndex, a3);
}

- (NSNumber)lastKnownScrollEndCardIndex
{
  return self->_lastKnownScrollEndCardIndex;
}

- (void)setLastKnownScrollEndCardIndex:(id)a3
{
  objc_storeStrong((id *)&self->_lastKnownScrollEndCardIndex, a3);
}

- (UIButton)leftArrowButton
{
  return self->_leftArrowButton;
}

- (void)setLeftArrowButton:(id)a3
{
  objc_storeStrong((id *)&self->_leftArrowButton, a3);
}

- (UIButton)rightArrowButton
{
  return self->_rightArrowButton;
}

- (void)setRightArrowButton:(id)a3
{
  objc_storeStrong((id *)&self->_rightArrowButton, a3);
}

- (NSNumber)hoveringCardIndex
{
  return self->_hoveringCardIndex;
}

- (void)setHoveringCardIndex:(id)a3
{
  self->_hoveringCardIndex = (NSNumber *)a3;
}

- (NSNumber)incomingCardIndex
{
  return self->_incomingCardIndex;
}

- (void)setIncomingCardIndex:(id)a3
{
  self->_incomingCardIndex = (NSNumber *)a3;
}

- (NSNumber)outgoingCardIndex
{
  return self->_outgoingCardIndex;
}

- (void)setOutgoingCardIndex:(id)a3
{
  self->_outgoingCardIndex = (NSNumber *)a3;
}

- (BCCardSetViewControllerViewState)viewState
{
  return self->_viewState;
}

- (void)setViewState:(id)a3
{
  objc_storeStrong((id *)&self->_viewState, a3);
}

- (void)setStatusBarBackgroundController:(id)a3
{
  objc_storeStrong((id *)&self->_statusBarBackgroundController, a3);
}

- (CGSize)cardSize
{
  double width;
  double height;
  CGSize result;

  width = self->_cardSize.width;
  height = self->_cardSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setCardSize:(CGSize)a3
{
  self->_cardSize = a3;
}

- (BOOL)isPresentationTransitionCompleted
{
  return self->_isPresentationTransitionCompleted;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statusBarBackgroundController, 0);
  objc_storeStrong((id *)&self->_viewState, 0);
  objc_storeStrong((id *)&self->_rightArrowButton, 0);
  objc_storeStrong((id *)&self->_leftArrowButton, 0);
  objc_storeStrong((id *)&self->_lastKnownScrollEndCardIndex, 0);
  objc_storeStrong((id *)&self->_scrollStartCardIndex, 0);
  objc_storeStrong((id *)&self->_suspendedCardsScrollingAssertions, 0);
  objc_storeStrong((id *)&self->_scrollingAssertions, 0);
  objc_storeStrong(&self->_endExpandedBlock, 0);
  objc_storeStrong((id *)&self->_suspendedCardViewControllers, 0);
  objc_storeStrong((id *)&self->_displayedCardViewControllers, 0);
  objc_destroyWeak((id *)&self->_configuration);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_edgePanGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_scrollView, 0);
  objc_storeStrong((id *)&self->_percentDrivenInteractiveTransition, 0);
  objc_storeStrong((id *)&self->_navigationSkrimView, 0);
}

@end
