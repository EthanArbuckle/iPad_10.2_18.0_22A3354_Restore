@implementation CRLiOSInsertPageViewControllerTitlesPageControl

- (CRLiOSInsertPageViewControllerTitlesPageControl)initWithTitles:(id)a3
{
  id v4;
  double y;
  double width;
  double height;
  CRLiOSInsertPageViewControllerTitlesPageControl *v8;
  id v9;
  double v11;
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
  id v24;
  id v25;
  void **v27;
  uint64_t v28;
  void (*v29)(uint64_t, void *);
  void *v30;
  CRLiOSInsertPageViewControllerTitlesPageControl *v31;
  id v32;
  objc_super v33;

  v4 = a3;
  v33.receiver = self;
  v33.super_class = (Class)CRLiOSInsertPageViewControllerTitlesPageControl;
  y = CGRectZero.origin.y;
  width = CGRectZero.size.width;
  height = CGRectZero.size.height;
  v8 = -[CRLiOSInsertPageViewControllerTitlesPageControl initWithFrame:](&v33, "initWithFrame:", CGRectZero.origin.x, y, width, height);
  if (v8)
  {
    v9 = objc_msgSend(objc_alloc((Class)UIStackView), "initWithFrame:", CGRectZero.origin.x, y, width, height);
    objc_msgSend(v9, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v9, "setAxis:", 0);
    objc_msgSend(v9, "setLayoutMarginsRelativeArrangement:", 1);
    if (sub_1003A91F4())
      v11 = 8.0;
    else
      v11 = 0.0;
    objc_msgSend(v9, "setLayoutMargins:", 8.0, v11);
    -[CRLiOSInsertPageViewControllerTitlesPageControl addSubview:](v8, "addSubview:", v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "topAnchor"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSInsertPageViewControllerTitlesPageControl topAnchor](v8, "topAnchor"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "constraintEqualToAnchor:", v13));
    objc_msgSend(v14, "setActive:", 1);

    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "leadingAnchor"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSInsertPageViewControllerTitlesPageControl leadingAnchor](v8, "leadingAnchor"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "constraintEqualToAnchor:", v16));
    objc_msgSend(v17, "setActive:", 1);

    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "bottomAnchor"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSInsertPageViewControllerTitlesPageControl bottomAnchor](v8, "bottomAnchor"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "constraintEqualToAnchor:", v19));
    objc_msgSend(v20, "setActive:", 1);

    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "trailingAnchor"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSInsertPageViewControllerTitlesPageControl trailingAnchor](v8, "trailingAnchor"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "constraintEqualToAnchor:", v22));
    objc_msgSend(v23, "setActive:", 1);

    objc_storeWeak((id *)&v8->_stackView, v9);
    v27 = _NSConcreteStackBlock;
    v28 = 3221225472;
    v29 = sub_1001378D0;
    v30 = &unk_10123ABF0;
    v31 = v8;
    v32 = v9;
    v24 = v9;
    objc_msgSend(v4, "enumerateObjectsUsingBlock:", &v27);
    v25 = objc_alloc_init((Class)UILargeContentViewerInteraction);
    objc_msgSend(v24, "addInteraction:", v25, v27, v28, v29, v30);

  }
  return v8;
}

- (void)setSelectedTitleIndex:(unint64_t)a3
{
  unint64_t v5;
  void *v6;
  void *v7;
  unint64_t v8;
  unsigned int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  uint64_t v16;
  uint8_t buf[4];
  unsigned int v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  int v24;
  __int16 v25;
  uint64_t v26;
  __int16 v27;
  unint64_t v28;
  __int16 v29;
  unint64_t v30;

  v5 = -[CRLiOSInsertPageViewControllerTitlesPageControl p_buttonCount](self, "p_buttonCount");
  if (v5 <= a3)
  {
    v8 = v5;
    v9 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10123AC10);
    v10 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
    {
      v15 = v10;
      *(_DWORD *)buf = 67110658;
      v18 = v9;
      v19 = 2082;
      v20 = "-[CRLiOSInsertPageViewControllerTitlesPageControl setSelectedTitleIndex:]";
      v21 = 2082;
      v22 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/iOS/Views/CRLiOSInsertPageViewController.m";
      v23 = 1024;
      v24 = 184;
      v25 = 2112;
      v26 = objc_opt_class(self, v16);
      v27 = 2048;
      v28 = a3;
      v29 = 2048;
      v30 = v8;
      _os_log_error_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d %@: Attempted to set a selected title index of %lu but there are only %lu buttons.", buf, 0x40u);

    }
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10123AC30);
    v11 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSInsertPageViewControllerTitlesPageControl setSelectedTitleIndex:]"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/iOS/Views/CRLiOSInsertPageViewController.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v12, v13, 184, 0, "%@: Attempted to set a selected title index of %lu but there are only %lu buttons.", objc_opt_class(self, v14), a3, v8);

  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSInsertPageViewControllerTitlesPageControl selectedButton](self, "selectedButton"));
    objc_msgSend(v6, "setSelected:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSInsertPageViewControllerTitlesPageControl p_buttonAtIndex:](self, "p_buttonAtIndex:", a3));
    objc_msgSend(v7, "setSelected:", 1);

  }
  self->_selectedTitleIndex = a3;
}

- (UIButton)selectedButton
{
  return (UIButton *)-[CRLiOSInsertPageViewControllerTitlesPageControl p_buttonAtIndex:](self, "p_buttonAtIndex:", -[CRLiOSInsertPageViewControllerTitlesPageControl selectedTitleIndex](self, "selectedTitleIndex"));
}

- (id)p_buttonAtIndex:(unint64_t)a3
{
  objc_class *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;

  v5 = (objc_class *)objc_opt_class(UIButton, a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSInsertPageViewControllerTitlesPageControl p_stackView](self, "p_stackView"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "arrangedSubviews"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectAtIndexedSubscript:", a3));
  v9 = sub_1002223BC(v5, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);

  return v10;
}

- (unint64_t)p_indexOfButton:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSInsertPageViewControllerTitlesPageControl p_stackView](self, "p_stackView"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "arrangedSubviews"));
  v7 = objc_msgSend(v6, "indexOfObject:", v4);

  return (unint64_t)v7;
}

- (unint64_t)p_buttonCount
{
  void *v2;
  void *v3;
  id v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSInsertPageViewControllerTitlesPageControl p_stackView](self, "p_stackView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "arrangedSubviews"));
  v4 = objc_msgSend(v3, "count");

  return (unint64_t)v4;
}

- (void)p_didTapButton:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  id v14;
  uint64_t v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  _BYTE v26[128];

  v4 = -[CRLiOSInsertPageViewControllerTitlesPageControl p_indexOfButton:](self, "p_indexOfButton:", a3);
  v5 = -[CRLiOSInsertPageViewControllerTitlesPageControl selectedTitleIndex](self, "selectedTitleIndex");
  -[CRLiOSInsertPageViewControllerTitlesPageControl setSelectedTitleIndex:](self, "setSelectedTitleIndex:", v4);
  if (v5 != v4)
  {
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSInsertPageViewControllerTitlesPageControl allTargets](self, "allTargets"));
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v22;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v22 != v9)
            objc_enumerationMutation(v6);
          v11 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)v10);
          v17 = 0u;
          v18 = 0u;
          v19 = 0u;
          v20 = 0u;
          v12 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSInsertPageViewControllerTitlesPageControl actionsForTarget:forControlEvent:](self, "actionsForTarget:forControlEvent:", v11, 4096, 0));
          v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
          if (v13)
          {
            v14 = v13;
            v15 = *(_QWORD *)v18;
            do
            {
              v16 = 0;
              do
              {
                if (*(_QWORD *)v18 != v15)
                  objc_enumerationMutation(v12);
                -[CRLiOSInsertPageViewControllerTitlesPageControl sendAction:to:forEvent:](self, "sendAction:to:forEvent:", NSSelectorFromString(*(NSString **)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)v16)), v11, 0);
                v16 = (char *)v16 + 1;
              }
              while (v14 != v16);
              v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
            }
            while (v14);
          }

          v10 = (char *)v10 + 1;
        }
        while (v10 != v8);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
      }
      while (v8);
    }

  }
}

- (unint64_t)selectedTitleIndex
{
  return self->_selectedTitleIndex;
}

- (UIStackView)p_stackView
{
  return (UIStackView *)objc_loadWeakRetained((id *)&self->_stackView);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_stackView);
}

@end
