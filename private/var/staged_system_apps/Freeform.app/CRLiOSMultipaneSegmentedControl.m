@implementation CRLiOSMultipaneSegmentedControl

- (CRLiOSMultipaneSegmentedControl)initWithItems:(id)a3
{
  id v4;
  char *v5;
  id v6;
  void *v7;
  CRLiOSVibrantBackdropView *v8;
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
  id v22;
  id v23;
  id v24;
  uint64_t v25;
  void *i;
  uint64_t v27;
  void *v28;
  id v29;
  void *v30;
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  objc_super v37;
  _BYTE v38[128];

  v4 = a3;
  v37.receiver = self;
  v37.super_class = (Class)CRLiOSMultipaneSegmentedControl;
  v5 = -[CRLiOSMultipaneSegmentedControl initWithFrame:](&v37, "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  if (v5)
  {
    v6 = objc_alloc_init((Class)NSMutableArray);
    v7 = (void *)*((_QWORD *)v5 + 5);
    *((_QWORD *)v5 + 5) = v6;

    *((_QWORD *)v5 + 3) = 14;
    *((_QWORD *)v5 + 4) = 12;
    v8 = -[CRLiOSVibrantBackdropView initWithCorners:radius:style:]([CRLiOSVibrantBackdropView alloc], "initWithCorners:radius:style:", 5, 0, 7.5);
    v9 = (void *)*((_QWORD *)v5 + 14);
    *((_QWORD *)v5 + 14) = v8;

    objc_msgSend(*((id *)v5 + 14), "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v5, "addSubview:", *((_QWORD *)v5 + 14));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*((id *)v5 + 14), "leadingAnchor"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "leadingAnchor"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "constraintEqualToAnchor:", v11));
    objc_msgSend(v12, "setActive:", 1);

    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*((id *)v5 + 14), "trailingAnchor"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "trailingAnchor"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "constraintEqualToAnchor:", v14));
    objc_msgSend(v15, "setActive:", 1);

    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*((id *)v5 + 14), "topAnchor"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "topAnchor"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "constraintEqualToAnchor:", v17));
    objc_msgSend(v18, "setActive:", 1);

    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*((id *)v5 + 14), "bottomAnchor"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "bottomAnchor"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "constraintEqualToAnchor:", v20));
    objc_msgSend(v21, "setActive:", 1);

    v5[9] = 1;
    *((_QWORD *)v5 + 2) = -1;
    *(_OWORD *)(v5 + 120) = xmmword_100EEC140;
    *(_OWORD *)(v5 + 136) = xmmword_100EEC140;
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v32 = v4;
    v22 = v4;
    v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
    if (v23)
    {
      v24 = v23;
      v25 = *(_QWORD *)v34;
      do
      {
        for (i = 0; i != v24; i = (char *)i + 1)
        {
          if (*(_QWORD *)v34 != v25)
            objc_enumerationMutation(v22);
          v27 = *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * (_QWORD)i);
          *((_QWORD *)v5 + 2) = 0;
          v28 = (void *)objc_claimAutoreleasedReturnValue(+[CRLiOSMultipaneSegmentedControlSegment segmentWithObject:edgeInsets:](CRLiOSMultipaneSegmentedControlSegment, "segmentWithObject:edgeInsets:", v27, *((double *)v5 + 15), *((double *)v5 + 16), *((double *)v5 + 17), *((double *)v5 + 18)));
          if (v28)
            objc_msgSend(v5, "p_insertSegment:atIndex:", v28, -1);

        }
        v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
      }
      while (v24);
    }

    v29 = objc_alloc_init((Class)UILargeContentViewerInteraction);
    objc_msgSend(v5, "addInteraction:", v29);

    v5[9] = 0;
    v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v30, "addObserver:selector:name:object:", v5, "p_updateBackgroundImagesForAllButtons", UIAccessibilityDarkerSystemColorsStatusDidChangeNotification, 0);

    v4 = v32;
  }

  return (CRLiOSMultipaneSegmentedControl *)v5;
}

- (CRLiOSMultipaneSegmentedControl)initWithFrame:(CGRect)a3
{
  return -[CRLiOSMultipaneSegmentedControl initWithItems:](self, "initWithItems:", &__NSArray0__struct, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (CRLiOSMultipaneSegmentedControl)initWithCoder:(id)a3
{
  return -[CRLiOSMultipaneSegmentedControl initWithItems:](self, "initWithItems:", &__NSArray0__struct);
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)CRLiOSMultipaneSegmentedControl;
  -[CRLiOSMultipaneSegmentedControl dealloc](&v4, "dealloc");
}

- (unint64_t)numberOfSegments
{
  return (unint64_t)-[NSMutableArray count](self->_segments, "count");
}

- (void)setSelectedSegmentIndex:(int64_t)a3
{
  -[CRLiOSMultipaneSegmentedControl p_setSelectedSegmentIndex:animated:notify:](self, "p_setSelectedSegmentIndex:animated:notify:", a3, 0, 0);
}

- (BOOL)isBackdropHidden
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSMultipaneSegmentedControl backdropView](self, "backdropView"));
  v3 = objc_msgSend(v2, "isHidden");

  return v3;
}

- (void)setBackdropHidden:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(-[CRLiOSMultipaneSegmentedControl backdropView](self, "backdropView"));
  objc_msgSend(v4, "setHidden:", v3);

}

- (void)setSegmentHuggingEnabled:(BOOL)a3
{
  if (self->_segmentHuggingEnabled != a3)
  {
    self->_segmentHuggingEnabled = a3;
    self->_needsRemoveAllConstraints = 1;
    -[CRLiOSMultipaneSegmentedControl setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
  }
}

- (void)insertSegmentWithTitle:(id)a3 atIndex:(unint64_t)a4 animated:(BOOL)a5
{
  id v7;

  v7 = (id)objc_claimAutoreleasedReturnValue(+[CRLiOSMultipaneSegmentedControlSegment segmentWithString:edgeInsets:](CRLiOSMultipaneSegmentedControlSegment, "segmentWithString:edgeInsets:", a3, a4, a5, self->_defaultEdgeInsets.top, self->_defaultEdgeInsets.left, self->_defaultEdgeInsets.bottom, self->_defaultEdgeInsets.right));
  -[CRLiOSMultipaneSegmentedControl p_insertSegment:atIndex:](self, "p_insertSegment:atIndex:", v7, a4);

}

- (void)insertSegmentWithImage:(id)a3 atIndex:(unint64_t)a4 animated:(BOOL)a5
{
  id v7;

  v7 = (id)objc_claimAutoreleasedReturnValue(+[CRLiOSMultipaneSegmentedControlSegment segmentWithImage:edgeInsets:](CRLiOSMultipaneSegmentedControlSegment, "segmentWithImage:edgeInsets:", a3, a4, a5, self->_defaultEdgeInsets.top, self->_defaultEdgeInsets.left, self->_defaultEdgeInsets.bottom, self->_defaultEdgeInsets.right));
  -[CRLiOSMultipaneSegmentedControl p_insertSegment:atIndex:](self, "p_insertSegment:atIndex:", v7, a4);

}

- (void)removeSegmentAtIndex:(unint64_t)a3 animated:(BOOL)a4
{
  void *v6;
  int64_t selectedSegmentIndex;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  if ((unint64_t)-[NSMutableArray count](self->_segments, "count", a3, a4) <= a3)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10122CDC8);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE8B5C();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10122CDE8);
    v10 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSMultipaneSegmentedControl removeSegmentAtIndex:animated:]"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/iOS/Controls/CRLiOSMultipaneSegmentedControl.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v11, v12, 259, 0, "Tried to remove out of bounds segment index: %lu", a3);

  }
  else
  {
    v13 = (id)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](self->_segments, "objectAtIndexedSubscript:", a3));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "button"));
    objc_msgSend(v6, "removeFromSuperview");

    -[NSMutableArray removeObjectAtIndex:](self->_segments, "removeObjectAtIndex:", a3);
    if (-[NSMutableArray count](self->_segments, "count"))
    {
      selectedSegmentIndex = self->_selectedSegmentIndex;
      v8 = -[NSMutableArray count](self->_segments, "count");
      if (selectedSegmentIndex >= (uint64_t)v8 - 1)
        v9 = (uint64_t)v8 - 1;
      else
        v9 = selectedSegmentIndex;
    }
    else
    {
      v9 = -1;
    }
    -[CRLiOSMultipaneSegmentedControl setSelectedSegmentIndex:](self, "setSelectedSegmentIndex:", v9);
    self->_needsRemoveAllConstraints = 1;
    -[CRLiOSMultipaneSegmentedControl setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");

  }
}

- (void)removeAllSegments
{
  char *v3;
  char *v4;

  v3 = (char *)-[NSMutableArray count](self->_segments, "count");
  if (v3)
  {
    v4 = v3;
    do
    {
      -[CRLiOSMultipaneSegmentedControl removeSegmentAtIndex:animated:](self, "removeSegmentAtIndex:animated:", 0, 0);
      --v4;
    }
    while (v4);
  }
}

- (void)setTitle:(id)a3 forSegmentAtIndex:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a3;
  if ((unint64_t)-[NSMutableArray count](self->_segments, "count") <= a4)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10122CE08);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE8BDC();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10122CE28);
    v8 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSMultipaneSegmentedControl setTitle:forSegmentAtIndex:]"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/iOS/Controls/CRLiOSMultipaneSegmentedControl.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v9, v10, 287, 0, "Tried to set title for out of bounds segment index: %lu", a4);

  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](self->_segments, "objectAtIndexedSubscript:", a4));
    objc_msgSend(v7, "setTitle:", v6);
    objc_msgSend(v7, "setAccessibilityLabel:", v6);
    self->_needsUpdateTitles = 1;
    -[CRLiOSMultipaneSegmentedControl p_updateButtonForSegment:](self, "p_updateButtonForSegment:", v7);
    self->_needsUpdateTitles = 0;

  }
}

- (id)titleForSegmentAtIndex:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  if ((unint64_t)-[NSMutableArray count](self->_segments, "count") <= a3)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10122CE48);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE8C5C();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10122CE68);
    v7 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSMultipaneSegmentedControl titleForSegmentAtIndex:]"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/iOS/Controls/CRLiOSMultipaneSegmentedControl.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v8, v9, 302, 0, "Tried to get title for out of bounds segment index: %lu", a3);

    v6 = 0;
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](self->_segments, "objectAtIndexedSubscript:", a3));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "title"));

  }
  return v6;
}

- (void)setImage:(id)a3 forSegmentAtIndex:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a3;
  if ((unint64_t)-[NSMutableArray count](self->_segments, "count") <= a4)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10122CE88);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE8CDC();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10122CEA8);
    v8 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSMultipaneSegmentedControl setImage:forSegmentAtIndex:]"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/iOS/Controls/CRLiOSMultipaneSegmentedControl.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v9, v10, 311, 0, "Tried to set image for out of bounds segment index: %lu", a4);

  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](self->_segments, "objectAtIndexedSubscript:", a4));
    objc_msgSend(v7, "setImage:", v6);
    -[CRLiOSMultipaneSegmentedControl p_updateButtonForSegment:](self, "p_updateButtonForSegment:", v7);

  }
}

- (id)imageForSegmentAtIndex:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  if ((unint64_t)-[NSMutableArray count](self->_segments, "count") <= a3)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10122CEC8);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE8D5C();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10122CEE8);
    v7 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSMultipaneSegmentedControl imageForSegmentAtIndex:]"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/iOS/Controls/CRLiOSMultipaneSegmentedControl.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v8, v9, 323, 0, "Tried to get image for out of bounds segment index: %lu", a3);

    v6 = 0;
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](self->_segments, "objectAtIndexedSubscript:", a3));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "image"));

  }
  return v6;
}

- (void)setWidth:(double)a3 forSegmentAtIndex:(unint64_t)a4
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  if ((unint64_t)-[NSMutableArray count](self->_segments, "count") <= a4)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10122CF08);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE8DDC();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10122CF28);
    v8 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSMultipaneSegmentedControl setWidth:forSegmentAtIndex:]"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/iOS/Controls/CRLiOSMultipaneSegmentedControl.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v9, v10, 332, 0, "Tried to set width of bounds segment index: %lu", a4);

  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](self->_segments, "objectAtIndexedSubscript:", a4));
    objc_msgSend(v7, "setWidth:", a3);

    -[CRLiOSMultipaneSegmentedControl setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
  }
}

- (double)widthForSegmentAtIndex:(unint64_t)a3
{
  void *v5;
  double v6;
  double v7;
  void *v9;
  void *v10;
  void *v11;

  if ((unint64_t)-[NSMutableArray count](self->_segments, "count") <= a3)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10122CF48);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE8E5C();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10122CF68);
    v9 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSMultipaneSegmentedControl widthForSegmentAtIndex:]"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/iOS/Controls/CRLiOSMultipaneSegmentedControl.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v10, v11, 343, 0, "Tried to get width for out of bounds segment index: %lu", a3);

    return 0.0;
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](self->_segments, "objectAtIndexedSubscript:", a3));
    objc_msgSend(v5, "width");
    v7 = v6;

    return v7;
  }
}

- (void)setEdgeInsets:(UIEdgeInsets)a3 forSegmentAtIndex:(unint64_t)a4
{
  double right;
  double bottom;
  double left;
  double top;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  right = a3.right;
  bottom = a3.bottom;
  left = a3.left;
  top = a3.top;
  if ((unint64_t)-[NSMutableArray count](self->_segments, "count") <= a4)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10122CF88);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE8EDC();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10122CFA8);
    v10 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSMultipaneSegmentedControl setEdgeInsets:forSegmentAtIndex:]"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/iOS/Controls/CRLiOSMultipaneSegmentedControl.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v11, v12, 352, 0, "Tried to set edge insets for out of bounds segment index: %lu", a4);

  }
  else
  {
    v13 = (id)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](self->_segments, "objectAtIndexedSubscript:", a4));
    objc_msgSend(v13, "setEdgeInsets:", top, left, bottom, right);
    -[CRLiOSMultipaneSegmentedControl p_updateButtonForSegment:](self, "p_updateButtonForSegment:", v13);

  }
}

- (UIEdgeInsets)edgeInsetsForSegmentAtIndex:(unint64_t)a3
{
  void *v5;
  double v6;
  CGFloat top;
  double v8;
  CGFloat left;
  double v10;
  CGFloat bottom;
  double v12;
  CGFloat right;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  UIEdgeInsets result;

  if ((unint64_t)-[NSMutableArray count](self->_segments, "count") <= a3)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10122CFC8);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE8F5C();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10122CFE8);
    v14 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSMultipaneSegmentedControl edgeInsetsForSegmentAtIndex:]"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/iOS/Controls/CRLiOSMultipaneSegmentedControl.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v15, v16, 364, 0, "Tried to get edge insets for out of bounds segment index: %lu", a3);

    top = UIEdgeInsetsZero.top;
    left = UIEdgeInsetsZero.left;
    bottom = UIEdgeInsetsZero.bottom;
    right = UIEdgeInsetsZero.right;
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](self->_segments, "objectAtIndexedSubscript:", a3));
    objc_msgSend(v5, "edgeInsets");
    top = v6;
    left = v8;
    bottom = v10;
    right = v12;

  }
  v17 = top;
  v18 = left;
  v19 = bottom;
  v20 = right;
  result.right = v20;
  result.bottom = v19;
  result.left = v18;
  result.top = v17;
  return result;
}

- (void)setAllEdgeInsets:(UIEdgeInsets)a3
{
  double right;
  double bottom;
  double left;
  double top;
  unint64_t v8;
  void *v9;

  right = a3.right;
  bottom = a3.bottom;
  left = a3.left;
  top = a3.top;
  if (-[NSMutableArray count](self->_segments, "count"))
  {
    v8 = 0;
    do
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](self->_segments, "objectAtIndexedSubscript:", v8));
      objc_msgSend(v9, "setEdgeInsets:", top, left, bottom, right);
      -[CRLiOSMultipaneSegmentedControl p_updateButtonForSegment:](self, "p_updateButtonForSegment:", v9);

      ++v8;
    }
    while (v8 < (unint64_t)-[NSMutableArray count](self->_segments, "count"));
  }
  self->_defaultEdgeInsets.top = top;
  self->_defaultEdgeInsets.left = left;
  self->_defaultEdgeInsets.bottom = bottom;
  self->_defaultEdgeInsets.right = right;
}

- (void)setEnabled:(BOOL)a3 forSegmentAtIndex:(unint64_t)a4
{
  _BOOL8 v5;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v5 = a3;
  if ((unint64_t)-[NSMutableArray count](self->_segments, "count") <= a4)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10122D008);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE8FDC();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10122D028);
    v7 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSMultipaneSegmentedControl setEnabled:forSegmentAtIndex:]"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/iOS/Controls/CRLiOSMultipaneSegmentedControl.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v8, v9, 384, 0, "Tried to set enabled state for out of bounds segment index: %lu", a4);

  }
  else
  {
    v10 = (id)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](self->_segments, "objectAtIndexedSubscript:", a4));
    objc_msgSend(v10, "setEnabled:", v5);
    -[CRLiOSMultipaneSegmentedControl p_updateButtonForSegment:](self, "p_updateButtonForSegment:", v10);

  }
}

- (BOOL)isEnabledForSegmentAtIndex:(unint64_t)a3
{
  void *v5;
  unsigned __int8 v6;
  void *v8;
  void *v9;
  void *v10;

  if ((unint64_t)-[NSMutableArray count](self->_segments, "count") <= a3)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10122D048);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE905C();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10122D068);
    v8 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSMultipaneSegmentedControl isEnabledForSegmentAtIndex:]"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/iOS/Controls/CRLiOSMultipaneSegmentedControl.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v9, v10, 396, 0, "Tried to get enabled state for out of bounds segment index: %lu", a3);

    return 0;
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](self->_segments, "objectAtIndexedSubscript:", a3));
    v6 = objc_msgSend(v5, "isEnabled");

    return v6;
  }
}

- (void)setTitleTextAttributes:(id)a3 forState:(unint64_t)a4
{
  id v6;

  v6 = a3;
  switch(a4)
  {
    case 0uLL:
      -[CRLiOSMultipaneSegmentedControl setOverrideNormalTitleAttributes:](self, "setOverrideNormalTitleAttributes:", v6);
      break;
    case 1uLL:
      -[CRLiOSMultipaneSegmentedControl setOverrideHighlightedTitleAttributes:](self, "setOverrideHighlightedTitleAttributes:", v6);
      break;
    case 2uLL:
      -[CRLiOSMultipaneSegmentedControl setOverrideDisabledTitleAttributes:](self, "setOverrideDisabledTitleAttributes:", v6);
      break;
    case 4uLL:
      -[CRLiOSMultipaneSegmentedControl setOverrideSelectedTitleAttributes:](self, "setOverrideSelectedTitleAttributes:", v6);
      break;
    default:
      break;
  }
  self->_needsUpdateTitles = 1;
  -[CRLiOSMultipaneSegmentedControl p_updateAllButtons](self, "p_updateAllButtons");

}

- (id)titleTextAttributesForState:(unint64_t)a3
{
  void *v4;

  v4 = 0;
  switch(a3)
  {
    case 0uLL:
      v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSMultipaneSegmentedControl overrideNormalTitleAttributes](self, "overrideNormalTitleAttributes"));
      break;
    case 1uLL:
      v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSMultipaneSegmentedControl overrideHighlightedTitleAttributes](self, "overrideHighlightedTitleAttributes"));
      break;
    case 2uLL:
      v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSMultipaneSegmentedControl overrideDisabledTitleAttributes](self, "overrideDisabledTitleAttributes"));
      break;
    case 4uLL:
      v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSMultipaneSegmentedControl overrideSelectedTitleAttributes](self, "overrideSelectedTitleAttributes"));
      break;
    default:
      return v4;
  }
  return v4;
}

- (void)setButtonHighlightedColorPreset:(int64_t)a3
{
  if (self->_buttonHighlightedColorPreset != a3)
  {
    self->_buttonHighlightedColorPreset = a3;
    -[CRLiOSMultipaneSegmentedControl p_updateBackgroundImagesForAllButtons](self, "p_updateBackgroundImagesForAllButtons");
  }
}

- (void)setButtonSelectedColorPreset:(int64_t)a3
{
  if (self->_buttonSelectedColorPreset != a3)
  {
    self->_buttonSelectedColorPreset = a3;
    -[CRLiOSMultipaneSegmentedControl p_updateBackgroundImagesForAllButtons](self, "p_updateBackgroundImagesForAllButtons");
  }
}

- (void)updateConstraints
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CRLiOSMultipaneSegmentedControl;
  -[CRLiOSMultipaneSegmentedControl updateConstraints](&v3, "updateConstraints");
  if (self->_needsRemoveAllConstraints)
  {
    -[CRLiOSMultipaneSegmentedControl p_removeAllConstraints](self, "p_removeAllConstraints");
    self->_needsRemoveAllConstraints = 0;
  }
  if (self->_segmentHuggingEnabled)
    -[CRLiOSMultipaneSegmentedControl p_updateConstraintsHugging](self, "p_updateConstraintsHugging");
  else
    -[CRLiOSMultipaneSegmentedControl p_updateConstraintsNormal](self, "p_updateConstraintsNormal");
}

- (void)p_removeAllConstraints
{
  char *v3;
  char *v4;
  char *v5;
  id v6;
  void *v7;
  void *v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v3 = (char *)-[NSMutableArray count](self->_segments, "count");
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = 0;
    do
    {
      v7 = v6;
      v15 = (id)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](self->_segments, "objectAtIndexedSubscript:", v5));

      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "button"));
      LODWORD(v9) = 1132068864;
      objc_msgSend(v8, "setContentHuggingPriority:forAxis:", 0, v9);

      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "leadingConstraint"));
      objc_msgSend(v10, "setActive:", 0);

      objc_msgSend(v15, "setLeadingConstraint:", 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "trailingConstraint"));
      objc_msgSend(v11, "setActive:", 0);

      objc_msgSend(v15, "setTrailingConstraint:", 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "widthConstraint"));
      objc_msgSend(v12, "setActive:", 0);

      objc_msgSend(v15, "setWidthConstraint:", 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "equalWidthConstraint"));
      objc_msgSend(v13, "setActive:", 0);

      objc_msgSend(v15, "setEqualWidthConstraint:", 0);
      objc_msgSend(v15, "setPreviousTrailingAnchor:", 0);
      objc_msgSend(v15, "setDistanceToPreviousTrailingAnchor:", 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "distanceBetweenPreviousAndNextSegmentConstraint"));
      objc_msgSend(v14, "setActive:", 0);

      objc_msgSend(v15, "setDistanceBetweenPreviousAndNextSegmentConstraint:", 0);
      v6 = v15;
      ++v5;
    }
    while (v4 != v5);

  }
}

- (void)p_updateConstraintsNormal
{
  char *v3;
  id v4;
  char *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  uint64_t v10;
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
  double v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  double v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  BOOL v45;
  void *v46;
  void *v47;
  double v48;
  void *v49;
  double v50;
  double v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  double v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  double v64;
  char *v65;
  char *v66;
  id v67;

  v3 = (char *)-[NSMutableArray count](self->_segments, "count");
  if (v3)
  {
    v67 = 0;
    v4 = 0;
    v5 = 0;
    v65 = v3 - 1;
    v66 = v3;
    while (1)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](self->_segments, "objectAtIndexedSubscript:", v5, v65));

      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "button"));
      objc_msgSend(v6, "width");
      v9 = v8;
      v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "leadingConstraint"));
      v11 = (void *)v10;
      if (v5)
      {
        if (v10)
        {
          v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "leadingConstraint"));
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "secondItem"));
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v67, "button"));
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "trailingAnchor"));

          if (v13 != v15)
          {
            v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "leadingConstraint"));
            objc_msgSend(v16, "setActive:", 0);

            objc_msgSend(v6, "setLeadingConstraint:", 0);
          }
        }
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "leadingConstraint"));

        if (!v17)
        {
          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "leadingAnchor"));
          v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v67, "button"));
          v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "trailingAnchor"));
          v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "constraintEqualToAnchor:", v20));
          objc_msgSend(v6, "setLeadingConstraint:", v21);

LABEL_14:
          v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "leadingConstraint"));
          LODWORD(v28) = 1148846080;
          objc_msgSend(v27, "setPriority:", v28);

          v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "leadingConstraint"));
          objc_msgSend(v29, "setActive:", 1);

        }
      }
      else
      {
        if (v10)
        {
          v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "leadingConstraint"));
          v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "secondItem"));
          v24 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSMultipaneSegmentedControl leadingAnchor](self, "leadingAnchor"));

          if (v23 != v24)
          {
            v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "leadingConstraint"));
            objc_msgSend(v25, "setActive:", 0);

            objc_msgSend(v6, "setLeadingConstraint:", 0);
          }
        }
        v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "leadingConstraint"));

        if (!v26)
        {
          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "leadingAnchor"));
          v19 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSMultipaneSegmentedControl leadingAnchor](self, "leadingAnchor"));
          v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "constraintEqualToAnchor:", v19));
          objc_msgSend(v6, "setLeadingConstraint:", v20);
          goto LABEL_14;
        }
      }
      v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "trailingConstraint"));

      if (v65 == v5)
      {
        if (!v30)
        {
          v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "trailingAnchor"));
          v32 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSMultipaneSegmentedControl trailingAnchor](self, "trailingAnchor"));
          v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "constraintEqualToAnchor:", v32));
          objc_msgSend(v6, "setTrailingConstraint:", v33);

          v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "trailingConstraint"));
          LODWORD(v35) = 1148846080;
          objc_msgSend(v34, "setPriority:", v35);

          v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "trailingConstraint"));
          objc_msgSend(v36, "setActive:", 1);

        }
      }
      else if (v30)
      {
        v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "trailingConstraint"));
        objc_msgSend(v37, "setActive:", 0);

        objc_msgSend(v6, "setTrailingConstraint:", 0);
      }
      v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "equalWidthConstraint"));

      v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "widthConstraint"));
      if (v9 == 0.0)
      {
        if (v39)
        {
          v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "widthConstraint"));
          objc_msgSend(v40, "setActive:", 0);

          objc_msgSend(v6, "setWidthConstraint:", 0);
        }
        if (v38)
        {
          v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "equalWidthConstraint"));
          v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "firstItem"));
          v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "button"));
          v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "widthAnchor"));
          v45 = v42 == v44;

          if (v4 && v42 == v44
            || (v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "equalWidthConstraint")),
                objc_msgSend(v46, "setActive:", 0),
                v46,
                objc_msgSend(v6, "setEqualWidthConstraint:", 0),
                !v4))
          {
LABEL_36:
            v52 = v67;
            v67 = v4;
            v4 = v6;
            goto LABEL_37;
          }
        }
        else
        {
          v45 = 0;
          if (!v4)
            goto LABEL_36;
        }
        if (!v45)
        {
          v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "button"));
          v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "widthAnchor"));
          v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "widthAnchor"));
          v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "constraintEqualToAnchor:", v55));
          objc_msgSend(v6, "setEqualWidthConstraint:", v56);

          v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "equalWidthConstraint"));
          LODWORD(v58) = 1148846080;
          objc_msgSend(v57, "setPriority:", v58);

          v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "equalWidthConstraint"));
          objc_msgSend(v59, "setActive:", 1);

        }
        goto LABEL_36;
      }
      if (v38)
      {
        v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "equalWidthConstraint"));
        objc_msgSend(v47, "setActive:", 0);

        objc_msgSend(v6, "setEqualWidthConstraint:", 0);
      }
      v48 = fabs(v9);
      if (!v39)
      {
        v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "widthAnchor"));
        v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "constraintEqualToConstant:", v48));
        objc_msgSend(v6, "setWidthConstraint:", v62);

        v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "widthConstraint"));
        LODWORD(v64) = 1148829696;
        objc_msgSend(v63, "setPriority:", v64);

        v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "widthConstraint"));
        objc_msgSend(v52, "setActive:", 1);
        goto LABEL_37;
      }
      v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "widthConstraint"));
      objc_msgSend(v49, "constant");
      v51 = v50;

      if (v51 != v48)
      {
        v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "widthConstraint"));
        objc_msgSend(v52, "setConstant:", v48);
LABEL_37:

      }
      v60 = v67;
      v67 = v6;

      if (v66 == ++v5)
      {

        return;
      }
    }
  }
}

- (void)p_updateConstraintsHugging
{
  CRLiOSMultipaneSegmentedControl *v2;
  char *v3;
  void *v4;
  char *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  uint64_t v13;
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
  BOOL v28;
  void *v29;
  void *v30;
  void *v31;
  double v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  double v39;
  void *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  uint64_t v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  char *v68;
  CRLiOSMultipaneSegmentedControl *v69;
  char *v70;
  id v71;

  v2 = self;
  v3 = (char *)-[NSMutableArray count](self->_segments, "count");
  if (v3)
  {
    v4 = 0;
    v5 = 0;
    v6 = 0;
    v70 = v3 - 1;
    v69 = v2;
    v68 = v3;
    while (1)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](v2->_segments, "objectAtIndexedSubscript:", v5));

      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "button"));
      if (v70 == v5)
        v9 = 0;
      else
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](v2->_segments, "objectAtIndexedSubscript:", v5 + 1));

      LODWORD(v10) = 1148846080;
      objc_msgSend(v8, "setContentHuggingPriority:forAxis:", 0, v10);
      LODWORD(v11) = 1148829696;
      objc_msgSend(v8, "setContentCompressionResistancePriority:forAxis:", 0, v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "titleLabel"));
      objc_msgSend(v12, "setAdjustsFontSizeToFitWidth:", 1);

      v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "leadingConstraint"));
      v14 = (void *)v13;
      if (v5)
      {
        if (v13)
        {
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "leadingConstraint"));
          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "secondItem"));
          v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "button"));
          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "trailingAnchor"));

          v2 = v69;
          if (v16 != v18)
          {
            v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "leadingConstraint"));
            objc_msgSend(v19, "setActive:", 0);

            objc_msgSend(v7, "setLeadingConstraint:", 0);
          }
        }
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "leadingConstraint"));

        if (!v20)
        {
          v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "leadingAnchor"));
          v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "button"));
          v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "trailingAnchor"));
          v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "constraintGreaterThanOrEqualToAnchor:", v23));
          objc_msgSend(v7, "setLeadingConstraint:", v24);

LABEL_17:
          v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "leadingConstraint"));
          LODWORD(v32) = 1148846080;
          objc_msgSend(v31, "setPriority:", v32);

          v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "leadingConstraint"));
          objc_msgSend(v33, "setActive:", 1);

          v2 = v69;
        }
      }
      else
      {
        if (v13)
        {
          v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "leadingConstraint"));
          v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "secondItem"));
          v27 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSMultipaneSegmentedControl leadingAnchor](v69, "leadingAnchor"));

          v28 = v26 == v27;
          v2 = v69;
          if (!v28)
          {
            v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "leadingConstraint"));
            objc_msgSend(v29, "setActive:", 0);

            objc_msgSend(v7, "setLeadingConstraint:", 0);
          }
        }
        v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "leadingConstraint"));

        if (!v30)
        {
          v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "leadingAnchor"));
          v22 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSMultipaneSegmentedControl leadingAnchor](v2, "leadingAnchor"));
          v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "constraintEqualToAnchor:", v22));
          objc_msgSend(v7, "setLeadingConstraint:", v23);
          goto LABEL_17;
        }
      }
      v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "trailingConstraint"));

      if (v70 == v5)
      {
        if (!v34)
        {
          v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "trailingAnchor"));
          v36 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSMultipaneSegmentedControl trailingAnchor](v2, "trailingAnchor"));
          v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "constraintEqualToAnchor:", v36));
          objc_msgSend(v7, "setTrailingConstraint:", v37);

          v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "trailingConstraint"));
          LODWORD(v39) = 1148846080;
          objc_msgSend(v38, "setPriority:", v39);

          v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "trailingConstraint"));
          objc_msgSend(v40, "setActive:", 1);

        }
      }
      else if (v34)
      {
        v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "trailingConstraint"));
        objc_msgSend(v41, "setActive:", 0);

        objc_msgSend(v7, "setTrailingConstraint:", 0);
      }
      if (v4)
      {
        v42 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "previousTrailingAnchor"));
        if (!v42)
          goto LABEL_27;
        v43 = (void *)v42;
        v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "button"));
        v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "trailingAnchor"));

        if (v43 != v45)
        {
          objc_msgSend(v7, "setPreviousTrailingAnchor:", 0);
          objc_msgSend(v7, "setDistanceToPreviousTrailingAnchor:", 0);

LABEL_27:
          v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "button"));
          v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "trailingAnchor"));

          objc_msgSend(v7, "setPreviousTrailingAnchor:", v43);
          v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "leadingAnchor"));
          v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "anchorWithOffsetToAnchor:", v47));
          objc_msgSend(v7, "setDistanceToPreviousTrailingAnchor:", v48);

        }
        if (!v9)
          goto LABEL_40;
        goto LABEL_29;
      }
      objc_msgSend(v7, "setPreviousTrailingAnchor:", 0);
      objc_msgSend(v7, "setDistanceToPreviousTrailingAnchor:", 0);
      v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "distanceBetweenPreviousAndNextSegmentConstraint"));
      objc_msgSend(v65, "setActive:", 0);

      objc_msgSend(v7, "setDistanceBetweenPreviousAndNextSegmentConstraint:", 0);
      if (!v9)
      {
LABEL_40:
        objc_msgSend(v7, "setPreviousTrailingAnchor:", 0);
        objc_msgSend(v7, "setDistanceToPreviousTrailingAnchor:", 0);
        v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "distanceBetweenPreviousAndNextSegmentConstraint"));
        objc_msgSend(v66, "setActive:", 0);

        objc_msgSend(v7, "setDistanceBetweenPreviousAndNextSegmentConstraint:", 0);
        goto LABEL_41;
      }
LABEL_29:
      v49 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "previousTrailingAnchor"));
      if (v49)
      {
        v50 = (void *)v49;
        v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "trailingAnchor"));

        if (v50 == v51)
          goto LABEL_33;
        objc_msgSend(v9, "setPreviousTrailingAnchor:", 0);
        objc_msgSend(v9, "setDistanceToPreviousTrailingAnchor:", 0);

      }
      v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "trailingAnchor"));
      objc_msgSend(v9, "setPreviousTrailingAnchor:", v50);
      v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "button"));
      v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "leadingAnchor"));
      v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "anchorWithOffsetToAnchor:", v53));
      objc_msgSend(v9, "setDistanceToPreviousTrailingAnchor:", v54);

LABEL_33:
      if (v4)
      {
        v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "distanceBetweenPreviousAndNextSegmentConstraint"));
        if (!v55)
          goto LABEL_38;
        v56 = v55;
        v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "firstItem"));
        v58 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "distanceToPreviousTrailingAnchor"));
        if (v57 != (void *)v58)
        {
          v59 = (void *)v58;
          v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "secondItem"));
          v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "distanceToPreviousTrailingAnchor"));

          if (v60 == v61)
          {
            v2 = v69;
          }
          else
          {
            objc_msgSend(v56, "setActive:", 0);

            v2 = v69;
LABEL_38:
            v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "distanceToPreviousTrailingAnchor"));
            v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "distanceToPreviousTrailingAnchor"));
            v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v62, "constraintEqualToAnchor:", v63));
            objc_msgSend(v7, "setDistanceBetweenPreviousAndNextSegmentConstraint:", v64);

            v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "distanceBetweenPreviousAndNextSegmentConstraint"));
            objc_msgSend(v57, "setActive:", 1);
            v56 = 0;
LABEL_43:

          }
          goto LABEL_45;
        }

        v2 = v69;
        goto LABEL_43;
      }
LABEL_41:
      v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "distanceBetweenPreviousAndNextSegmentConstraint"));
      objc_msgSend(v67, "setActive:", 0);

      objc_msgSend(v7, "setDistanceBetweenPreviousAndNextSegmentConstraint:", 0);
LABEL_45:
      v71 = v7;

      ++v5;
      v4 = v71;
      v6 = v9;
      if (v68 == v5)
      {

        return;
      }
    }
  }
}

- (void)tintColorDidChange
{
  NSDictionary *defaultNormalTitleAttributes;
  NSDictionary *defaultHighlightedTitleAttributes;
  NSDictionary *defaultSelectedTitleAttributes;
  NSDictionary *defaultDisabledTitleAttributes;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CRLiOSMultipaneSegmentedControl;
  -[CRLiOSMultipaneSegmentedControl tintColorDidChange](&v7, "tintColorDidChange");
  defaultNormalTitleAttributes = self->_defaultNormalTitleAttributes;
  self->_defaultNormalTitleAttributes = 0;

  defaultHighlightedTitleAttributes = self->_defaultHighlightedTitleAttributes;
  self->_defaultHighlightedTitleAttributes = 0;

  defaultSelectedTitleAttributes = self->_defaultSelectedTitleAttributes;
  self->_defaultSelectedTitleAttributes = 0;

  defaultDisabledTitleAttributes = self->_defaultDisabledTitleAttributes;
  self->_defaultDisabledTitleAttributes = 0;

  self->_needsUpdateTitles = 1;
  -[CRLiOSMultipaneSegmentedControl p_updateAllButtons](self, "p_updateAllButtons");
}

- (double)p_fontSize
{
  void *v2;
  void *v3;
  void *v4;
  double v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[CRLLocale currentLocale](CRLLocale, "currentLocale"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "locale"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "languageCode"));

  if (objc_msgSend(v4, "isEqualToString:", CFSTR("en")))
    v5 = 14.0;
  else
    v5 = 13.0;

  return v5;
}

- (NSDictionary)defaultNormalTitleAttributes
{
  NSDictionary *defaultNormalTitleAttributes;
  void *v4;
  void *v5;
  NSDictionary *v6;
  NSDictionary *v7;
  _QWORD v9[2];
  _QWORD v10[2];

  defaultNormalTitleAttributes = self->_defaultNormalTitleAttributes;
  if (!defaultNormalTitleAttributes)
  {
    v9[0] = NSForegroundColorAttributeName;
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSMultipaneSegmentedControl tintColor](self, "tintColor"));
    v10[0] = v4;
    v9[1] = NSFontAttributeName;
    -[CRLiOSMultipaneSegmentedControl p_fontSize](self, "p_fontSize");
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:weight:](UIFont, "systemFontOfSize:weight:"));
    v10[1] = v5;
    v6 = (NSDictionary *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v10, v9, 2));
    v7 = self->_defaultNormalTitleAttributes;
    self->_defaultNormalTitleAttributes = v6;

    defaultNormalTitleAttributes = self->_defaultNormalTitleAttributes;
  }
  return defaultNormalTitleAttributes;
}

- (NSDictionary)defaultSelectedTitleAttributes
{
  NSDictionary *defaultSelectedTitleAttributes;
  void *v4;
  void *v5;
  NSDictionary *v6;
  NSDictionary *v7;
  _QWORD v9[2];
  _QWORD v10[2];

  defaultSelectedTitleAttributes = self->_defaultSelectedTitleAttributes;
  if (!defaultSelectedTitleAttributes)
  {
    v9[0] = NSForegroundColorAttributeName;
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
    v10[0] = v4;
    v9[1] = NSFontAttributeName;
    -[CRLiOSMultipaneSegmentedControl p_fontSize](self, "p_fontSize");
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:weight:](UIFont, "systemFontOfSize:weight:"));
    v10[1] = v5;
    v6 = (NSDictionary *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v10, v9, 2));
    v7 = self->_defaultSelectedTitleAttributes;
    self->_defaultSelectedTitleAttributes = v6;

    defaultSelectedTitleAttributes = self->_defaultSelectedTitleAttributes;
  }
  return defaultSelectedTitleAttributes;
}

- (NSDictionary)defaultDisabledTitleAttributes
{
  NSDictionary *defaultDisabledTitleAttributes;
  void *v4;
  void *v5;
  void *v6;
  NSDictionary *v7;
  NSDictionary *v8;
  double v10;
  double v11;
  _QWORD v12[2];
  _QWORD v13[2];

  defaultDisabledTitleAttributes = self->_defaultDisabledTitleAttributes;
  if (!defaultDisabledTitleAttributes)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSMultipaneSegmentedControl tintColor](self, "tintColor"));
    v10 = 0.0;
    v11 = 0.0;
    objc_msgSend(v4, "getWhite:alpha:", &v11, &v10);
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", v11, v10 * 0.35));

    v13[0] = v5;
    v12[0] = NSForegroundColorAttributeName;
    v12[1] = NSFontAttributeName;
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:weight:](UIFont, "systemFontOfSize:weight:", 14.0, UIFontWeightMedium));
    v13[1] = v6;
    v7 = (NSDictionary *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v13, v12, 2));
    v8 = self->_defaultDisabledTitleAttributes;
    self->_defaultDisabledTitleAttributes = v7;

    defaultDisabledTitleAttributes = self->_defaultDisabledTitleAttributes;
  }
  return defaultDisabledTitleAttributes;
}

- (id)effectiveTitleAttributesForState:(unint64_t)a3
{
  void *v5;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSMultipaneSegmentedControl titleTextAttributesForState:](self, "titleTextAttributesForState:"));
  if (!v5)
  {
    switch(a3)
    {
      case 0uLL:
        v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSMultipaneSegmentedControl defaultNormalTitleAttributes](self, "defaultNormalTitleAttributes"));
        break;
      case 1uLL:
        v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSMultipaneSegmentedControl defaultHighlightedTitleAttributes](self, "defaultHighlightedTitleAttributes"));
        break;
      case 2uLL:
        v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSMultipaneSegmentedControl defaultDisabledTitleAttributes](self, "defaultDisabledTitleAttributes"));
        break;
      case 4uLL:
        v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSMultipaneSegmentedControl defaultSelectedTitleAttributes](self, "defaultSelectedTitleAttributes"));
        break;
      default:
        return v5;
    }
  }
  return v5;
}

- (id)p_segmentForButton:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];

  v4 = a3;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSMultipaneSegmentedControl segments](self, "segments"));
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v18;
LABEL_3:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v18 != v8)
        objc_enumerationMutation(v5);
      v10 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v9);
      v11 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "button"));

      if (v11 == v4)
        break;
      if (v7 == (id)++v9)
      {
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
        if (v7)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
    v12 = v10;

    if (v12)
      goto LABEL_20;
  }
  else
  {
LABEL_9:

  }
  +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_10122D088);
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
    sub_100DE90DC();
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_10122D0A8);
  v13 = off_1013D9070;
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
    sub_100DE7468(v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSMultipaneSegmentedControl p_segmentForButton:]"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/iOS/Controls/CRLiOSMultipaneSegmentedControl.m"));
  +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v14, v15, 876, 0, "invalid nil value for '%{public}s'", "segment");

  v12 = 0;
LABEL_20:

  return v12;
}

- (void)p_insertSegment:(id)a3 atIndex:(unint64_t)a4
{
  NSMutableArray *segments;
  id v7;
  id v8;
  unint64_t v9;

  segments = self->_segments;
  v7 = a3;
  v8 = -[NSMutableArray count](segments, "count");
  if ((unint64_t)v8 >= a4)
    v9 = a4;
  else
    v9 = (unint64_t)v8;
  -[NSMutableArray insertObject:atIndex:](self->_segments, "insertObject:atIndex:", v7, v9);
  self->_needsUpdateTitles = 1;
  -[CRLiOSMultipaneSegmentedControl p_updateButtonForSegment:](self, "p_updateButtonForSegment:", v7);

  self->_needsUpdateTitles = 0;
  self->_needsRemoveAllConstraints = 1;
  -[CRLiOSMultipaneSegmentedControl setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
}

- (void)p_setSelectedSegmentIndex:(int64_t)a3 animated:(BOOL)a4 notify:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL4 v6;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  int64_t v14;
  unsigned int v15;
  _QWORD v16[5];
  uint8_t buf[4];
  unsigned int v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  int v24;
  __int16 v25;
  int64_t v26;
  __int16 v27;
  id v28;

  if (self->_selectedSegmentIndex != a3)
  {
    v5 = a5;
    v6 = a4;
    v9 = -[NSMutableArray count](self->_segments, "count");
    if ((uint64_t)v9 <= a3)
    {
      v15 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_10122D0C8);
      v10 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67110402;
        v18 = v15;
        v19 = 2082;
        v20 = "-[CRLiOSMultipaneSegmentedControl p_setSelectedSegmentIndex:animated:notify:]";
        v21 = 2082;
        v22 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/iOS/Controls/CRLiOSMultipaneSegmentedControl.m";
        v23 = 1024;
        v24 = 901;
        v25 = 2048;
        v26 = a3;
        v27 = 2048;
        v28 = v9;
        _os_log_error_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Selecting out of bounds segment in segmented control: %li (count: %li)", buf, 0x36u);
      }
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_10122D0E8);
      v11 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DE7468(v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSMultipaneSegmentedControl p_setSelectedSegmentIndex:animated:notify:]"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/iOS/Controls/CRLiOSMultipaneSegmentedControl.m"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v12, v13, 901, 0, "Selecting out of bounds segment in segmented control: %li (count: %li)", a3, v9);

    }
    v14 = (int64_t)v9 - 1;
    if ((uint64_t)v9 - 1 >= a3)
      v14 = a3;
    self->_selectedSegmentIndex = v14;
    if (v6)
    {
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = sub_100017E00;
      v16[3] = &unk_10122D110;
      v16[4] = self;
      +[UIView animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:](UIView, "animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:", 0, v16, 0, 0.2, 0.0, 0.95, 0.0);
      if (!v5)
        return;
    }
    else
    {
      -[CRLiOSMultipaneSegmentedControl p_updateAllButtons](self, "p_updateAllButtons");
      -[CRLiOSMultipaneSegmentedControl setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
      if (!v5)
        return;
    }
    -[CRLiOSMultipaneSegmentedControl sendActionsForControlEvents:](self, "sendActionsForControlEvents:", 4096);
  }
}

- (void)p_updateAllButtons
{
  NSMutableArray *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];

  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v3 = self->_segments;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        -[CRLiOSMultipaneSegmentedControl p_updateButtonForSegment:](self, "p_updateButtonForSegment:", *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * (_QWORD)v7), (_QWORD)v8);
        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

  self->_needsUpdateTitles = 0;
}

- (void)p_updateButtonForSegment:(id)a3
{
  void *v4;
  _BOOL4 needsUpdateTitles;
  id v6;
  _BOOL4 v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  uint64_t v36;
  uint64_t v37;
  id v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  void *v45;
  void *v46;
  __CFString *v47;
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
  id v58;

  v58 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "button"));
  needsUpdateTitles = self->_needsUpdateTitles;
  v6 = -[NSMutableArray indexOfObject:](self->_segments, "indexOfObject:", v58);
  v7 = needsUpdateTitles;
  if (!v4)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSMultipaneSegmentedControl p_newButton](self, "p_newButton"));
    objc_msgSend(v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSMultipaneSegmentedControl backdropView](self, "backdropView"));
    -[CRLiOSMultipaneSegmentedControl insertSubview:aboveSubview:](self, "insertSubview:aboveSubview:", v4, v8);

    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "titleLabel"));
    objc_msgSend(v9, "setMinimumScaleFactor:", 0.5);

    -[CRLiOSMultipaneSegmentedControl edgeInsetsForSegmentAtIndex:](self, "edgeInsetsForSegmentAtIndex:", v6);
    objc_msgSend(v4, "setContentEdgeInsets:");
    -[CRLiOSMultipaneSegmentedControl edgeInsetsForSegmentAtIndex:](self, "edgeInsetsForSegmentAtIndex:", v6);
    v11 = v10;
    v13 = v12;
    v15 = v14;
    v17 = v16;
    v19 = objc_opt_class(_TtC8Freeform21CRLiOSPageTitleButton, v18);
    v20 = sub_100221D0C(v19, v4);
    v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
    objc_msgSend(v21, "setInsets:", v11, v13, v15, v17);

    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "topAnchor"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSMultipaneSegmentedControl topAnchor](self, "topAnchor"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "constraintEqualToAnchor:", v23));
    v7 = 1;
    objc_msgSend(v24, "setActive:", 1);

    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "bottomAnchor"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSMultipaneSegmentedControl bottomAnchor](self, "bottomAnchor"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "constraintEqualToAnchor:", v26));
    objc_msgSend(v27, "setActive:", 1);

    objc_msgSend(v4, "addTarget:action:forControlEvents:", self, "p_buttonTouchDown:", 1);
    objc_msgSend(v4, "addTarget:action:forControlEvents:", self, "p_buttonTouchUpInside:", 64);
    objc_msgSend(v4, "addTarget:action:forControlEvents:", self, "p_buttonTouchUpOutside:", 128);
    objc_msgSend(v4, "addTarget:action:forControlEvents:", self, "p_buttonTouchCancel:", 256);
    objc_msgSend(v4, "setShowsLargeContentViewer:", 1);
    -[CRLiOSMultipaneSegmentedControl p_updateBackgroundImagesForButton:](self, "p_updateBackgroundImagesForButton:", v4);
    objc_msgSend(v58, "setButton:", v4);
  }
  objc_msgSend(v4, "setSelected:", v6 == (id)self->_selectedSegmentIndex);
  objc_msgSend(v4, "setEnabled:", objc_msgSend(v58, "isEnabled"));
  objc_msgSend(v58, "edgeInsets");
  objc_msgSend(v4, "setContentEdgeInsets:");
  objc_msgSend(v58, "edgeInsets");
  v29 = v28;
  v31 = v30;
  v33 = v32;
  v35 = v34;
  v37 = objc_opt_class(_TtC8Freeform21CRLiOSPageTitleButton, v36);
  v38 = sub_100221D0C(v37, v4);
  v39 = (void *)objc_claimAutoreleasedReturnValue(v38);
  objc_msgSend(v39, "setInsets:", v29, v31, v33, v35);

  if (objc_msgSend(v58, "type"))
  {
    objc_msgSend(v4, "setAttributedTitle:forState:", 0, 0);
    objc_msgSend(v4, "setAttributedTitle:forState:", 0, 1);
    objc_msgSend(v4, "setAttributedTitle:forState:", 0, 4);
    objc_msgSend(v4, "setAttributedTitle:forState:", 0, 2);
    v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "image"));
    objc_msgSend(v4, "setImage:forState:", v40, 0);

    objc_msgSend(v4, "setAdjustsImageWhenHighlighted:", 1);
    if ((objc_msgSend(v4, "isEnabled") & 1) != 0)
    {
      if (objc_msgSend(v4, "isSelected"))
      {
        v41 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSMultipaneSegmentedControl effectiveTitleAttributesForState:](self, "effectiveTitleAttributesForState:", 4));
        v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "objectForKeyedSubscript:", NSForegroundColorAttributeName));
        objc_msgSend(v4, "setTintColor:", v42);

        v43 = v4;
        v44 = 0;
      }
      else
      {
        v50 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSMultipaneSegmentedControl effectiveTitleAttributesForState:](self, "effectiveTitleAttributesForState:", 0));
        v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "objectForKeyedSubscript:", NSForegroundColorAttributeName));
        objc_msgSend(v4, "setTintColor:", v51);

        v43 = v4;
        v44 = 1;
      }
      objc_msgSend(v43, "setAdjustsImageWhenHighlighted:", v44);
    }
    else
    {
      v48 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSMultipaneSegmentedControl effectiveTitleAttributesForState:](self, "effectiveTitleAttributesForState:", 2));
      v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "objectForKeyedSubscript:", NSForegroundColorAttributeName));
      objc_msgSend(v4, "setTintColor:", v49);

    }
LABEL_15:
    v45 = v58;
    goto LABEL_16;
  }
  objc_msgSend(v4, "setImage:forState:", 0, 0);
  v45 = v58;
  if (v7)
  {
    v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "title"));
    if (v46)
      v47 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "title"));
    else
      v47 = &stru_1012A72B0;

    v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "configuration"));
    objc_msgSend(v52, "setTitle:", v47);

    v53 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSMultipaneSegmentedControl p_attributedStringForTitle:forState:](self, "p_attributedStringForTitle:forState:", v47, 0));
    v54 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSMultipaneSegmentedControl p_attributedStringForTitle:forState:](self, "p_attributedStringForTitle:forState:", v47, 1));
    v55 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSMultipaneSegmentedControl p_attributedStringForTitle:forState:](self, "p_attributedStringForTitle:forState:", v47, 4));
    v56 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSMultipaneSegmentedControl p_attributedStringForTitle:forState:](self, "p_attributedStringForTitle:forState:", v47, 2));
    objc_msgSend(v4, "setAttributedTitle:forState:", v53, 0);
    objc_msgSend(v4, "setAttributedTitle:forState:", v54, 1);
    objc_msgSend(v4, "setAttributedTitle:forState:", v55, 4);
    objc_msgSend(v4, "setAttributedTitle:forState:", v55, 5);
    objc_msgSend(v4, "setAttributedTitle:forState:", v56, 2);

    goto LABEL_15;
  }
LABEL_16:
  v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "accessibilityLabel"));
  objc_msgSend(v4, "setAccessibilityLabel:", v57);

}

- (void)_dynamicUserInterfaceTraitDidChange
{
  -[CRLiOSMultipaneSegmentedControl p_updateBackgroundImagesForAllButtons](self, "p_updateBackgroundImagesForAllButtons");
}

- (void)p_updateBackgroundImagesForButton:(id)a3
{
  id v4;
  void *v5;
  int64_t buttonHighlightedColorPreset;
  void *v7;
  void *v8;
  int64_t buttonSelectedColorPreset;
  void *v10;
  void *v11;
  id v12;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[CRLiOSVisualEffectHelper sharedHelper](CRLiOSVisualEffectHelper, "sharedHelper"));
  buttonHighlightedColorPreset = self->_buttonHighlightedColorPreset;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSMultipaneSegmentedControl traitCollection](self, "traitCollection"));
  v12 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "resizableCornerImageWithRadius:corners:colorPreset:forTraitCollection:", 5, buttonHighlightedColorPreset, v7, 7.5));

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[CRLiOSVisualEffectHelper sharedHelper](CRLiOSVisualEffectHelper, "sharedHelper"));
  buttonSelectedColorPreset = self->_buttonSelectedColorPreset;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSMultipaneSegmentedControl traitCollection](self, "traitCollection"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "resizableCornerImageWithRadius:corners:colorPreset:forTraitCollection:", 5, buttonSelectedColorPreset, v10, 7.5));

  objc_msgSend(v4, "setBackgroundImage:forState:", v12, 1);
  objc_msgSend(v4, "setBackgroundImage:forState:", v11, 4);
  objc_msgSend(v4, "setBackgroundImage:forState:", v11, 5);

}

- (void)p_updateBackgroundImagesForAllButtons
{
  char *v3;
  char *v4;
  char *i;
  void *v6;
  void *v7;

  v3 = (char *)-[NSMutableArray count](self->_segments, "count");
  if (v3)
  {
    v4 = v3;
    for (i = 0; i != v4; ++i)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](self->_segments, "objectAtIndexedSubscript:", i));
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "button"));
      -[CRLiOSMultipaneSegmentedControl p_updateBackgroundImagesForButton:](self, "p_updateBackgroundImagesForButton:", v7);

    }
  }
}

- (void)p_buttonTouchDown:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  -[CRLiOSMultipaneSegmentedControl sendActionsForControlEvents:](self, "sendActionsForControlEvents:", 1);
  v6 = objc_opt_class(_TtC8Freeform21CRLiOSPageTitleButton, v5);
  if ((objc_opt_isKindOfClass(v4, v6) & 1) == 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[CRLiOSVisualEffectHelper sharedHelper](CRLiOSVisualEffectHelper, "sharedHelper"));
    v9 = v4;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v9, 1));
    objc_msgSend(v7, "applyTouchDownAnimationToViews:", v8);

  }
}

- (void)p_buttonTouchUpInside:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  id v13;
  id v14;

  v4 = a3;
  v6 = objc_opt_class(_TtC8Freeform21CRLiOSPageTitleButton, v5);
  if ((objc_opt_isKindOfClass(v4, v6) & 1) == 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[CRLiOSVisualEffectHelper sharedHelper](CRLiOSVisualEffectHelper, "sharedHelper"));
    v14 = v4;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v14, 1));
    objc_msgSend(v7, "applyTouchUpAnimationToViews:", v8);

  }
  v9 = -[NSMutableArray count](self->_segments, "count");
  if (v9)
  {
    v10 = v9;
    v11 = 0;
    while (1)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](self->_segments, "objectAtIndexedSubscript:", v11));
      v13 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "button"));

      if (v13 == v4)
        break;
      if (v10 == (id)++v11)
        goto LABEL_9;
    }
    -[CRLiOSMultipaneSegmentedControl p_setSelectedSegmentIndex:animated:notify:](self, "p_setSelectedSegmentIndex:animated:notify:", v11, 1, 1);
  }
LABEL_9:
  -[CRLiOSMultipaneSegmentedControl sendActionsForControlEvents:](self, "sendActionsForControlEvents:", 64);

}

- (void)p_buttonTouchUpOutside:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  -[CRLiOSMultipaneSegmentedControl sendActionsForControlEvents:](self, "sendActionsForControlEvents:", 128);
  v6 = objc_opt_class(_TtC8Freeform21CRLiOSPageTitleButton, v5);
  if ((objc_opt_isKindOfClass(v4, v6) & 1) == 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[CRLiOSVisualEffectHelper sharedHelper](CRLiOSVisualEffectHelper, "sharedHelper"));
    v9 = v4;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v9, 1));
    objc_msgSend(v7, "applyTouchUpAnimationToViews:", v8);

  }
}

- (void)p_buttonTouchCancel:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  -[CRLiOSMultipaneSegmentedControl sendActionsForControlEvents:](self, "sendActionsForControlEvents:", 256);
  v6 = objc_opt_class(_TtC8Freeform21CRLiOSPageTitleButton, v5);
  if ((objc_opt_isKindOfClass(v4, v6) & 1) == 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[CRLiOSVisualEffectHelper sharedHelper](CRLiOSVisualEffectHelper, "sharedHelper"));
    v9 = v4;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v9, 1));
    objc_msgSend(v7, "applyTouchUpAnimationToViews:", v8);

  }
}

- (id)p_attributedStringForTitle:(id)a3 forState:(unint64_t)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;

  v6 = a3;
  v7 = objc_alloc((Class)NSAttributedString);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSMultipaneSegmentedControl effectiveTitleAttributesForState:](self, "effectiveTitleAttributesForState:", a4));
  v9 = objc_msgSend(v7, "initWithString:attributes:", v6, v8);

  return v9;
}

- (id)p_newButton
{
  return -[CRLiOSPageTitleButton initWithTitle:insets:]([_TtC8Freeform21CRLiOSPageTitleButton alloc], "initWithTitle:insets:", &stru_1012A72B0, UIEdgeInsetsZero.top, UIEdgeInsetsZero.left, UIEdgeInsetsZero.bottom, UIEdgeInsetsZero.right);
}

- (int64_t)indexOfAccessibilityElement:(id)a3
{
  id v4;
  int64_t v5;
  void *v6;
  id v7;

  v4 = a3;
  if ((uint64_t)-[CRLiOSMultipaneSegmentedControl numberOfSegments](self, "numberOfSegments") < 1)
  {
LABEL_5:
    v5 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else
  {
    v5 = 0;
    while (1)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](self->_segments, "objectAtIndexedSubscript:", v5));
      v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "button"));

      if (v7 == v4)
        break;
      if (++v5 >= (uint64_t)-[CRLiOSMultipaneSegmentedControl numberOfSegments](self, "numberOfSegments"))
        goto LABEL_5;
    }
  }

  return v5;
}

- (id)accessibilityElementAtIndex:(int64_t)a3
{
  void *v5;
  void *v6;

  if (a3 < 0 || (uint64_t)-[CRLiOSMultipaneSegmentedControl numberOfSegments](self, "numberOfSegments") <= a3)
  {
    v6 = 0;
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](self->_segments, "objectAtIndexedSubscript:", a3));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "button"));

  }
  return v6;
}

- (id)p_viewControllerForPresentingAccessibilityHUD
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSMultipaneSegmentedControl nextResponder](self, "nextResponder"));
  if (v3)
  {
    do
    {
      v4 = objc_opt_class(UIViewController, v2);
      if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0)
        break;
      v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "nextResponder"));

      v3 = (void *)v5;
    }
    while (v5);
  }
  v6 = objc_opt_class(UIViewController, v2);
  v7 = sub_100221D0C(v6, v3);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v10 = objc_opt_class(UINavigationController, v9);
  if ((objc_opt_isKindOfClass(v8, v10) & 1) != 0)
  {
    v11 = v8;
  }
  else
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "navigationController"));

    if (!v12)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "keyWindow"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "rootViewController"));

      goto LABEL_10;
    }
    v11 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "navigationController"));
  }
  v13 = v11;
LABEL_10:

  return v13;
}

- (int64_t)selectedSegmentIndex
{
  return self->_selectedSegmentIndex;
}

- (BOOL)isSegmentHuggingEnabled
{
  return self->_segmentHuggingEnabled;
}

- (int64_t)buttonHighlightedColorPreset
{
  return self->_buttonHighlightedColorPreset;
}

- (int64_t)buttonSelectedColorPreset
{
  return self->_buttonSelectedColorPreset;
}

- (NSMutableArray)segments
{
  return self->_segments;
}

- (void)setSegments:(id)a3
{
  objc_storeStrong((id *)&self->_segments, a3);
}

- (void)setDefaultNormalTitleAttributes:(id)a3
{
  objc_storeStrong((id *)&self->_defaultNormalTitleAttributes, a3);
}

- (void)setDefaultHighlightedTitleAttributes:(id)a3
{
  objc_storeStrong((id *)&self->_defaultHighlightedTitleAttributes, a3);
}

- (void)setDefaultDisabledTitleAttributes:(id)a3
{
  objc_storeStrong((id *)&self->_defaultDisabledTitleAttributes, a3);
}

- (void)setDefaultSelectedTitleAttributes:(id)a3
{
  objc_storeStrong((id *)&self->_defaultSelectedTitleAttributes, a3);
}

- (NSDictionary)overrideNormalTitleAttributes
{
  return self->_overrideNormalTitleAttributes;
}

- (void)setOverrideNormalTitleAttributes:(id)a3
{
  objc_storeStrong((id *)&self->_overrideNormalTitleAttributes, a3);
}

- (NSDictionary)overrideHighlightedTitleAttributes
{
  return self->_overrideHighlightedTitleAttributes;
}

- (void)setOverrideHighlightedTitleAttributes:(id)a3
{
  objc_storeStrong((id *)&self->_overrideHighlightedTitleAttributes, a3);
}

- (NSDictionary)overrideDisabledTitleAttributes
{
  return self->_overrideDisabledTitleAttributes;
}

- (void)setOverrideDisabledTitleAttributes:(id)a3
{
  objc_storeStrong((id *)&self->_overrideDisabledTitleAttributes, a3);
}

- (NSDictionary)overrideSelectedTitleAttributes
{
  return self->_overrideSelectedTitleAttributes;
}

- (void)setOverrideSelectedTitleAttributes:(id)a3
{
  objc_storeStrong((id *)&self->_overrideSelectedTitleAttributes, a3);
}

- (CRLiOSVibrantBackdropView)backdropView
{
  return self->_backdropView;
}

- (void)setBackdropView:(id)a3
{
  objc_storeStrong((id *)&self->_backdropView, a3);
}

- (BOOL)needsUpdateTitles
{
  return self->_needsUpdateTitles;
}

- (void)setNeedsUpdateTitles:(BOOL)a3
{
  self->_needsUpdateTitles = a3;
}

- (BOOL)needsRemoveAllConstraints
{
  return self->_needsRemoveAllConstraints;
}

- (void)setNeedsRemoveAllConstraints:(BOOL)a3
{
  self->_needsRemoveAllConstraints = a3;
}

- (UIEdgeInsets)defaultEdgeInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_defaultEdgeInsets.top;
  left = self->_defaultEdgeInsets.left;
  bottom = self->_defaultEdgeInsets.bottom;
  right = self->_defaultEdgeInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setDefaultEdgeInsets:(UIEdgeInsets)a3
{
  self->_defaultEdgeInsets = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backdropView, 0);
  objc_storeStrong((id *)&self->_overrideSelectedTitleAttributes, 0);
  objc_storeStrong((id *)&self->_overrideDisabledTitleAttributes, 0);
  objc_storeStrong((id *)&self->_overrideHighlightedTitleAttributes, 0);
  objc_storeStrong((id *)&self->_overrideNormalTitleAttributes, 0);
  objc_storeStrong((id *)&self->_defaultSelectedTitleAttributes, 0);
  objc_storeStrong((id *)&self->_defaultDisabledTitleAttributes, 0);
  objc_storeStrong((id *)&self->_defaultHighlightedTitleAttributes, 0);
  objc_storeStrong((id *)&self->_defaultNormalTitleAttributes, 0);
  objc_storeStrong((id *)&self->_segments, 0);
}

@end
