@implementation MFConversationCellConfigurator

+ (id)log
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100150FD4;
  block[3] = &unk_10051A7D0;
  block[4] = a1;
  if (qword_1005AA0D8 != -1)
    dispatch_once(&qword_1005AA0D8, block);
  return (id)qword_1005AA0D0;
}

- (MFConversationCellConfigurator)initWithCollectionView:(id)a3
{
  id v5;
  MFConversationCellConfigurator *v6;
  MFConversationCellConfigurator *v7;
  MFConversationViewCellExpansionTracker *v8;
  MFConversationViewCellExpansionTracker *expansionTracker;
  MFConversationViewCellSizeTracker *v10;
  MFConversationViewCellSizeTracker *sizeTracker;
  objc_super v13;

  v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)MFConversationCellConfigurator;
  v6 = -[MFConversationCellConfigurator init](&v13, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_collectionView, a3);
    v8 = -[MFConversationViewCellExpansionTracker initWithDelegate:]([MFConversationViewCellExpansionTracker alloc], "initWithDelegate:", v7);
    expansionTracker = v7->_expansionTracker;
    v7->_expansionTracker = v8;

    v10 = objc_alloc_init(MFConversationViewCellSizeTracker);
    sizeTracker = v7->_sizeTracker;
    v7->_sizeTracker = v10;

    objc_msgSend(v5, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(MFExpandedMessageCell), CFSTR("kExpandedMessageCell"));
    objc_msgSend(v5, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(MFCollapsedMessageCell), CFSTR("kCollapsedMessageCell"));
    objc_msgSend(v5, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(0x100597000), CFSTR("kCollapsedSubjectMessageCell"));
    objc_msgSend(v5, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(MFGeneratedSummaryViewCell), CFSTR("kSummaryMessageCell"));
  }

  return v7;
}

- (id)unconfiguredCellForItemAtIndexPath:(id)a3
{
  id v4;
  const __CFString *v5;
  void *v6;
  unsigned int v7;
  void *v8;
  void *v9;

  v4 = a3;
  if (-[MFConversationCellConfigurator isSummaryItemAtIndexPath:](self, "isSummaryItemAtIndexPath:", v4))
  {
    v5 = CFSTR("kSummaryMessageCell");
  }
  else if (-[MFConversationCellConfigurator messageAtIndexPathIsExpandedOrSemiExpanded:](self, "messageAtIndexPathIsExpandedOrSemiExpanded:", v4))
  {
    v5 = CFSTR("kExpandedMessageCell");
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MFConversationCellConfigurator delegate](self, "delegate"));
    v7 = objc_msgSend(v6, "collapsedCellsShowsSubjectForCellConfigurator:", self);

    if (v7)
      v5 = CFSTR("kCollapsedSubjectMessageCell");
    else
      v5 = CFSTR("kCollapsedMessageCell");
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MFConversationCellConfigurator collectionView](self, "collectionView"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", v5, v4));

  return v9;
}

- (void)configureCell:(id)a3 forItemAtIndexPath:(id)a4 itemID:(id)a5 messageFuture:(id)a6 contentRequest:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  uint64_t v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  _QWORD v24[4];
  id v25;
  _QWORD v26[4];
  id v27;
  id v28;
  id v29;
  id v30;
  id location;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  objc_msgSend(v12, "setItemID:", v14);
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[MFConversationCellConfigurator displayMetrics](self, "displayMetrics"));
  objc_msgSend(v12, "setDisplayMetrics:", v17);

  v18 = objc_opt_class(MFMessageConversationViewCell);
  if ((objc_opt_isKindOfClass(v12, v18) & 1) != 0)
  {
    v19 = v12;
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[MFConversationCellConfigurator contactStore](self, "contactStore"));
    objc_msgSend(v19, "setContactStore:", v20);

    location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, self);
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[EFScheduler mainThreadScheduler](EFScheduler, "mainThreadScheduler"));
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_100151574;
    v26[3] = &unk_100520AC0;
    objc_copyWeak(&v30, &location);
    v22 = v19;
    v27 = v22;
    v23 = v16;
    v28 = v23;
    v29 = v13;
    objc_msgSend(v15, "onScheduler:addSuccessBlock:", v21, v26);

    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_100151B64;
    v24[3] = &unk_10051B140;
    v25 = v23;
    objc_msgSend(v15, "addFailureBlock:", v24);

    objc_destroyWeak(&v30);
    objc_destroyWeak(&location);

  }
}

- (void)configureCell:(id)a3 forItemAtIndexPath:(id)a4 itemID:(id)a5 manualSummaryContext:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  ConversationCellViewModel *v15;
  ConversationCellViewModel *v16;
  void *v17;
  id v18;
  _QWORD v19[4];
  id v20;

  v18 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  objc_msgSend(v18, "setItemID:", v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[MFConversationCellConfigurator displayMetrics](self, "displayMetrics"));
  objc_msgSend(v18, "setDisplayMetrics:", v13);

  v14 = objc_opt_class(MFGeneratedSummaryViewCell);
  if ((objc_opt_isKindOfClass(v18, v14) & 1) != 0)
  {
    v15 = [ConversationCellViewModel alloc];
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_100151DA0;
    v19[3] = &unk_100520AE8;
    v20 = v12;
    v16 = -[ConversationCellViewModel initWithBuilder:](v15, "initWithBuilder:", v19);
    objc_msgSend(v18, "setViewModel:", v16);

    v17 = (void *)objc_claimAutoreleasedReturnValue(-[MFConversationCellConfigurator delegate](self, "delegate"));
    objc_msgSend(v17, "cellConfigurator:didConfigureCell:atIndexPath:", self, v18, v10);

  }
}

- (int64_t)expansionStatusForMessageAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  int v14;
  uint64_t v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  id v19;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MFConversationCellConfigurator delegate](self, "delegate"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "cellConfigurator:messageItemIDAtIndexPath:", self, v4));
  if (!v6)
  {
    v11 = objc_claimAutoreleasedReturnValue(+[MFConversationCellConfigurator log](MFConversationCellConfigurator, "log"));
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      sub_100393E74((uint64_t)v4, v11, v12);
    goto LABEL_7;
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MFConversationCellConfigurator expansionTracker](self, "expansionTracker"));
  v8 = objc_msgSend(v7, "expansionStatusForCellWithItemID:", v6);

  if (!v8)
  {
    v9 = objc_msgSend(v5, "cellConfigurator:expansionStatusForMessageAtIndexPath:", self, v4);
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MFConversationCellConfigurator expansionTracker](self, "expansionTracker"));
    objc_msgSend(v10, "setMessageWithItemID:expansionStatus:", v6, v9);

    v11 = objc_claimAutoreleasedReturnValue(+[MFConversationCellConfigurator log](MFConversationCellConfigurator, "log"));
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v14 = 134218498;
      v15 = 0;
      v16 = 2114;
      v17 = v6;
      v18 = 2114;
      v19 = v4;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Determined expansion status:%ld itemID:%{public}@ indexPath:%{public}@", (uint8_t *)&v14, 0x20u);
    }
LABEL_7:

    v8 = 0;
  }

  return (int64_t)v8;
}

- (BOOL)messageAtIndexPathIsExpanded:(id)a3
{
  return (id)-[MFConversationCellConfigurator expansionStatusForMessageAtIndexPath:](self, "expansionStatusForMessageAtIndexPath:", a3) == (id)3;
}

- (BOOL)messageAtIndexPathIsExpandedOrSemiExpanded:(id)a3
{
  return (-[MFConversationCellConfigurator expansionStatusForMessageAtIndexPath:](self, "expansionStatusForMessageAtIndexPath:", a3) & 0xFFFFFFFFFFFFFFFELL) == 2;
}

- (BOOL)isMessageItemAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  char isKindOfClass;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MFConversationCellConfigurator delegate](self, "delegate"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "cellConfigurator:messageItemIDAtIndexPath:", self, v4));
  v7 = objc_opt_class(EMMessageCollectionItemID);
  isKindOfClass = objc_opt_isKindOfClass(v6, v7);

  return isKindOfClass & 1;
}

- (BOOL)isSummaryItemAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  char isKindOfClass;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MFConversationCellConfigurator delegate](self, "delegate"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "cellConfigurator:messageItemIDAtIndexPath:", self, v4));
  v7 = objc_opt_class(MFGeneratedSummaryCollectionItemID);
  isKindOfClass = objc_opt_isKindOfClass(v6, v7);

  return isKindOfClass & 1;
}

- (CGSize)sizeForItemAtIndexPath:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  CGFloat width;
  double height;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  void *v29;
  CGSize result;

  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MFConversationCellConfigurator delegate](self, "delegate"));
  v7 = v6;
  width = CGSizeZero.width;
  height = CGSizeZero.height;
  if (v6)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "cellConfigurator:messageItemIDAtIndexPath:", self, v5));
    if (!v10)
    {
      v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
      objc_msgSend(v29, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MFConversationCellConfigurator.m"), 200, CFSTR("messageItemID cannot be nil."));

    }
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[MFConversationCellConfigurator sizeTracker](self, "sizeTracker"));
    objc_msgSend(v11, "displaySizeForCellWithItemID:", v10);
    v13 = v12;
    v15 = v14;

    if (-[MFConversationCellConfigurator isSummaryItemAtIndexPath:](self, "isSummaryItemAtIndexPath:", v5))
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[MFConversationCellConfigurator sizeTracker](self, "sizeTracker"));
      objc_msgSend(v16, "intrinsicSizeForCellWithItemID:", v10);
      v18 = v17;
      v20 = v19;

      if (v20 == height && v18 == CGSizeZero.width)
        v15 = 0.0;
    }
    else
    {
      v22 = (void *)objc_claimAutoreleasedReturnValue(-[MFConversationCellConfigurator expansionTracker](self, "expansionTracker"));
      v23 = objc_msgSend(v22, "expansionStatusForCellWithItemID:", v10);

      if (!v23)
      {
        v23 = objc_msgSend(v7, "cellConfigurator:expansionStatusForMessageAtIndexPath:", self, v5);
        v24 = (void *)objc_claimAutoreleasedReturnValue(-[MFConversationCellConfigurator expansionTracker](self, "expansionTracker"));
        objc_msgSend(v24, "setMessageWithItemID:expansionStatus:", v10, v23);

      }
      if (v23 == (id)1)
      {
        v25 = (void *)objc_claimAutoreleasedReturnValue(-[MFConversationCellConfigurator displayMetrics](self, "displayMetrics"));
        +[MFCollapsedMessageCell defaultHeightWithDisplayMetrics:](MFCollapsedMessageCell, "defaultHeightWithDisplayMetrics:", v25);
        v15 = v26;

      }
    }

    width = v13;
    height = v15;
  }

  v27 = width;
  v28 = height;
  result.height = v28;
  result.width = v27;
  return result;
}

- (void)setDisplayMetrics:(id)a3
{
  id v5;
  _QWORD v6[4];
  id v7;

  v5 = a3;
  if ((objc_msgSend(v5, "isEqual:", self->_displayMetrics) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_displayMetrics, a3);
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_100152414;
    v6[3] = &unk_10051BD20;
    v7 = v5;
    -[MFConversationCellConfigurator enumeratePreparedCellsWithBlock:](self, "enumeratePreparedCellsWithBlock:", v6);

  }
}

- (void)enumeratePreparedCellsWithBlock:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id v11;

  v7 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MFConversationCellConfigurator collectionView](self, "collectionView"));
  if (objc_msgSend(v4, "numberOfSections"))
  {
    v5 = objc_msgSend(v4, "numberOfItemsInSection:", 0);
    if (v5)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "preparedCells"));
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472;
      v8[2] = sub_10015253C;
      v8[3] = &unk_100520B10;
      v9 = v4;
      v11 = v5;
      v10 = v7;
      objc_msgSend(v6, "enumerateObjectsUsingBlock:", v8);

    }
  }

}

- (void)enumerateExpandedCellsWithBlock:(id)a3
{
  id v4;
  _QWORD v5[4];
  id v6;

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100152714;
  v5[3] = &unk_100520B38;
  v6 = a3;
  v4 = v6;
  -[MFConversationCellConfigurator enumeratePreparedCellsWithBlock:](self, "enumeratePreparedCellsWithBlock:", v5);

}

- (void)enumerateCollapsedCellsWithBlock:(id)a3
{
  id v4;
  _QWORD v5[4];
  id v6;

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100152838;
  v5[3] = &unk_100520B38;
  v6 = a3;
  v4 = v6;
  -[MFConversationCellConfigurator enumeratePreparedCellsWithBlock:](self, "enumeratePreparedCellsWithBlock:", v5);

}

- (void)resetCaches
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MFConversationCellConfigurator expansionTracker](self, "expansionTracker"));
  objc_msgSend(v3, "resetRecord");

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MFConversationCellConfigurator sizeTracker](self, "sizeTracker"));
  objc_msgSend(v4, "resetAllCellSizes");

  -[MFConversationCellConfigurator setLastAnimatedExpansionTimestamp:](self, "setLastAnimatedExpansionTimestamp:", 0);
}

- (UIViewPropertyAnimator)heightChangeAnimator
{
  UIViewPropertyAnimator *heightChangeAnimator;
  UIViewPropertyAnimator *v4;
  UIViewPropertyAnimator *v5;

  heightChangeAnimator = self->_heightChangeAnimator;
  if (!heightChangeAnimator)
  {
    v4 = (UIViewPropertyAnimator *)objc_msgSend(objc_alloc((Class)UIViewPropertyAnimator), "initWithDuration:dampingRatio:animations:", 0, 0.5, 1.0);
    v5 = self->_heightChangeAnimator;
    self->_heightChangeAnimator = v4;

    heightChangeAnimator = self->_heightChangeAnimator;
  }
  return heightChangeAnimator;
}

- (void)setCellAtIndexPath:(id)a3 highlighted:(BOOL)a4 animated:(BOOL)a5
{
  -[MFConversationCellConfigurator _setCellAtIndexPath:highlighted:animated:completion:](self, "_setCellAtIndexPath:highlighted:animated:completion:", a3, a4, a5, 0);
}

- (void)_setCellAtIndexPath:(id)a3 highlighted:(BOOL)a4 animated:(BOOL)a5 completion:(id)a6
{
  _BOOL4 v7;
  _BOOL4 v8;
  id v10;
  void (**v11)(id, uint64_t);
  void *v12;
  void *v13;
  void ***v14;
  void ***v15;
  double v16;
  void **v17;
  uint64_t v18;
  id (*v19)(uint64_t);
  void *v20;
  id v21;
  BOOL v22;

  v7 = a5;
  v8 = a4;
  v10 = a3;
  v11 = (void (**)(id, uint64_t))a6;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[MFConversationCellConfigurator collectionView](self, "collectionView"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "cellForItemAtIndexPath:", v10));

  if (v13 && (objc_msgSend(v13, "disallowsHighlighting") & 1) == 0)
  {
    v17 = _NSConcreteStackBlock;
    v18 = 3221225472;
    v19 = sub_100152B10;
    v20 = &unk_10051C6A8;
    v22 = v8;
    v21 = v13;
    v14 = objc_retainBlock(&v17);
    v15 = v14;
    if (v7)
    {
      v16 = 0.4;
      if (v8)
        v16 = 0.45;
      +[UIView animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:](UIView, "animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:", 0, v14, v11, v16, 0.0, 1.0, 0.0, v17, v18, v19, v20);
    }
    else
    {
      ((void (*)(void ***))v14[2])(v14);
      if (v11)
        v11[2](v11, 1);
    }

  }
}

- (void)expandCellAtIndexPath:(id)a3 animated:(BOOL)a4 highlightFirst:(BOOL)a5
{
  -[MFConversationCellConfigurator expandCellAtIndexPath:animated:highlightFirst:expansionStatus:](self, "expandCellAtIndexPath:animated:highlightFirst:expansionStatus:", a3, a4, a5, 3);
}

- (void)expandCellAtIndexPath:(id)a3 animated:(BOOL)a4 highlightFirst:(BOOL)a5 expansionStatus:(int64_t)a6
{
  _BOOL4 v7;
  id v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  double v14;
  double v15;
  float v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  id v22;
  void *v23;
  void *v24;
  _BOOL4 v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id val;
  _QWORD v31[4];
  id v32;
  _QWORD v33[4];
  id v34;
  id v35;
  id v36;
  id v37;
  BOOL v38;
  id location;
  _QWORD v40[4];
  id v41;
  id v42;
  _BYTE buf[12];

  v25 = a5;
  v7 = a4;
  v10 = a3;
  v11 = objc_claimAutoreleasedReturnValue(+[MFConversationCellConfigurator log](MFConversationCellConfigurator, "log"));
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)&buf[4] = v10;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "cellConfigurator expandCellAtIndexPath:%@", buf, 0xCu);
  }

  val = (id)objc_claimAutoreleasedReturnValue(-[MFConversationCellConfigurator delegate](self, "delegate"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[MFConversationCellConfigurator collectionView](self, "collectionView"));
  v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(val, "cellConfigurator:messageItemIDAtIndexPath:", self, v10));
  v27 = (void *)v12;
  if (!v12)
  {
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MFConversationCellConfigurator.m"), 345, CFSTR("messageItemID cannot be nil."));

    v12 = 0;
  }
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(val, "cellConfigurator:targetHeightForExpandingCellAtIndexPath:", self, v10));
  if (v28)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[MFConversationCellConfigurator sizeTracker](self, "sizeTracker"));
    objc_msgSend(v29, "frame");
    v15 = v14;
    objc_msgSend(v28, "floatValue");
    objc_msgSend(v13, "setIntrinsicSize:forCellWithItemID:", v12, v15, v16);

  }
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[MFConversationCellConfigurator expansionTracker](self, "expansionTracker"));
  objc_msgSend(v17, "setMessageWithItemID:expansionStatus:", v12, a6);

  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "collectionViewLayout"));
  objc_msgSend(v26, "setExpandingIndexPath:", v10);
  *(_QWORD *)buf = 0xAAAAAAAAAAAAAAAALL;
  objc_initWeak((id *)buf, self);
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[MFConversationCellConfigurator heightChangeAnimator](self, "heightChangeAnimator"));
  v40[0] = _NSConcreteStackBlock;
  v40[1] = 3221225472;
  v40[2] = sub_1001530E8;
  v40[3] = &unk_100520B60;
  objc_copyWeak(&v42, (id *)buf);
  v19 = v26;
  v41 = v19;
  objc_msgSend(v18, "addCompletion:", v40);

  -[MFConversationCellConfigurator setAnimatingHeightChange:](self, "setAnimatingHeightChange:", 1);
  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, val);
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[MFConversationCellConfigurator heightChangeAnimator](self, "heightChangeAnimator"));
  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472;
  v33[2] = sub_100153150;
  v33[3] = &unk_100520B88;
  objc_copyWeak(&v36, (id *)buf);
  objc_copyWeak(&v37, &location);
  v21 = v19;
  v34 = v21;
  v22 = v10;
  v35 = v22;
  v38 = v7;
  objc_msgSend(v20, "addAnimations:", v33);

  if (v7 && v25)
  {
    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472;
    v31[2] = sub_100153264;
    v31[3] = &unk_10051B978;
    objc_copyWeak(&v32, (id *)buf);
    -[MFConversationCellConfigurator _setCellAtIndexPath:highlighted:animated:completion:](self, "_setCellAtIndexPath:highlighted:animated:completion:", v22, 1, 1, v31);
    objc_destroyWeak(&v32);
  }
  else
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[MFConversationCellConfigurator heightChangeAnimator](self, "heightChangeAnimator"));
    objc_msgSend(v23, "startAnimation");

  }
  objc_destroyWeak(&v37);
  objc_destroyWeak(&v36);
  objc_destroyWeak(&location);

  objc_destroyWeak(&v42);
  objc_destroyWeak((id *)buf);

}

- (BOOL)animatePendingHeightChangesIfNecessary
{
  void *v3;
  double v4;
  double v5;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  id location;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MFConversationCellConfigurator lastAnimatedExpansionTimestamp](self, "lastAnimatedExpansionTimestamp"));
  objc_msgSend(v3, "timeIntervalSinceNow");
  v5 = v4;

  if (!-[MFConversationCellConfigurator animatingHeightChange](self, "animatingHeightChange")
    && (v5 >= 0.0 || v5 <= -1.0))
  {
    return 0;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MFConversationCellConfigurator collectionView](self, "collectionView"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "collectionViewLayout"));
  objc_msgSend(v9, "invalidateLayout");

  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MFConversationCellConfigurator heightChangeAnimator](self, "heightChangeAnimator"));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100153430;
  v11[3] = &unk_10051B1B8;
  objc_copyWeak(&v12, &location);
  objc_msgSend(v10, "addAnimations:", v11);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
  return 1;
}

- (void)expansionTracker:(id)a3 didChangeCollapsingAllowed:(BOOL)a4
{
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(-[MFConversationCellConfigurator delegate](self, "delegate", a3, a4));
  objc_msgSend(v5, "cellConfigurator:didInvalidateConfigurationForCellsAtIndexPaths:", self, 0);

}

- (MFConversationCellConfiguratorDelegate)delegate
{
  return (MFConversationCellConfiguratorDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (MFConversationViewCellExpansionTracker)expansionTracker
{
  return self->_expansionTracker;
}

- (void)setExpansionTracker:(id)a3
{
  objc_storeStrong((id *)&self->_expansionTracker, a3);
}

- (MFConversationViewCellSizeTracker)sizeTracker
{
  return self->_sizeTracker;
}

- (void)setSizeTracker:(id)a3
{
  objc_storeStrong((id *)&self->_sizeTracker, a3);
}

- (EMCachingContactStore)contactStore
{
  return self->_contactStore;
}

- (void)setContactStore:(id)a3
{
  objc_storeStrong((id *)&self->_contactStore, a3);
}

- (MUIBrandIndicatorProvider)brandIndicatorProvider
{
  return self->_brandIndicatorProvider;
}

- (void)setBrandIndicatorProvider:(id)a3
{
  objc_storeStrong((id *)&self->_brandIndicatorProvider, a3);
}

- (MFMessageDisplayMetrics)displayMetrics
{
  return self->_displayMetrics;
}

- (void)setHeightChangeAnimator:(id)a3
{
  objc_storeStrong((id *)&self->_heightChangeAnimator, a3);
}

- (UICollectionView)collectionView
{
  return self->_collectionView;
}

- (void)setCollectionView:(id)a3
{
  objc_storeStrong((id *)&self->_collectionView, a3);
}

- (NSDate)lastAnimatedExpansionTimestamp
{
  return self->_lastAnimatedExpansionTimestamp;
}

- (void)setLastAnimatedExpansionTimestamp:(id)a3
{
  objc_storeStrong((id *)&self->_lastAnimatedExpansionTimestamp, a3);
}

- (BOOL)animatingHeightChange
{
  return self->_animatingHeightChange;
}

- (void)setAnimatingHeightChange:(BOOL)a3
{
  self->_animatingHeightChange = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastAnimatedExpansionTimestamp, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
  objc_storeStrong((id *)&self->_heightChangeAnimator, 0);
  objc_storeStrong((id *)&self->_displayMetrics, 0);
  objc_storeStrong((id *)&self->_brandIndicatorProvider, 0);
  objc_storeStrong((id *)&self->_contactStore, 0);
  objc_storeStrong((id *)&self->_sizeTracker, 0);
  objc_storeStrong((id *)&self->_expansionTracker, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
