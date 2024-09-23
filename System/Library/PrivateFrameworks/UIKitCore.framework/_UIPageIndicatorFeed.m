@implementation _UIPageIndicatorFeed

- (id)indicatorForPage:(int64_t)a3
{
  return -[_UIPageIndicatorFeed indicatorForPage:forSizeOnly:](self, "indicatorForPage:forSizeOnly:", a3, 0);
}

- (void)prepareIndicatorsFrom:(int64_t)a3 to:(int64_t)a4
{
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  int64_t v12;
  unint64_t v13;
  void *v14;
  unint64_t v15;
  void *v16;
  void *v17;
  int64_t v18;
  id v19;
  void *v20;
  void *v21;
  int64_t v22;
  id v23;
  id v24;

  -[_UIPageIndicatorFeed activeQueue](self, "activeQueue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "page");

  -[_UIPageIndicatorFeed activeQueue](self, "activeQueue");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "lastObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "page");

  if (v9 <= a4)
  {
    if (a3 <= v12)
      goto LABEL_9;
  }
  else
  {
    -[_UIPageIndicatorFeed activeQueue](self, "activeQueue");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9 - a4 >= (unint64_t)objc_msgSend(v10, "count"))
    {

      goto LABEL_16;
    }
    if (a3 <= v12)
    {

LABEL_9:
      -[_UIPageIndicatorFeed activeQueue](self, "activeQueue");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "firstObject");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "page");

      while (v18 > a3)
        v19 = -[_UIPageIndicatorFeed indicatorForPage:](self, "indicatorForPage:", --v18);
      -[_UIPageIndicatorFeed activeQueue](self, "activeQueue");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "lastObject");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "page");

      if (v22 < a4)
      {
        do
          v23 = -[_UIPageIndicatorFeed indicatorForPage:](self, "indicatorForPage:", v22++);
        while (a4 != v22);
      }
      return;
    }
  }
  v13 = a3 - v12;
  -[_UIPageIndicatorFeed activeQueue](self, "activeQueue");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "count");

  if (v9 > a4)
  if (v13 < v15)
    goto LABEL_9;
LABEL_16:
  -[_UIPageIndicatorFeed invalidateIndicators](self, "invalidateIndicators");
  if (a3 < a4)
  {
    do
      v24 = -[_UIPageIndicatorFeed indicatorForPage:](self, "indicatorForPage:", a3++);
    while (a4 != a3);
  }
}

- (id)activeIndicatorForPage:(int64_t)a3
{
  void *v5;

  if (-[_UIPageIndicatorFeed _isPageWithinActiveBounds:](self, "_isPageWithinActiveBounds:"))
  {
    -[_UIPageIndicatorFeed indicatorForPage:](self, "indicatorForPage:", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (BOOL)_isPageWithinActiveBounds:(int64_t)a3
{
  BOOL v5;
  void *v6;
  void *v7;
  BOOL v8;
  void *v9;
  void *v10;

  v5 = (a3 & 0x8000000000000000) == 0 && -[UIPageControl numberOfPages](self->_pageControl, "numberOfPages") > a3;
  -[_UIPageIndicatorFeed activeQueue](self, "activeQueue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "page") <= a3)
  {
    -[_UIPageIndicatorFeed activeQueue](self, "activeQueue");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "lastObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v10, "page") >= a3;

  }
  else
  {
    v8 = 0;
  }

  return v5 && v8;
}

- (NSArray)indicators
{
  void *v2;
  void *v3;

  -[_UIPageIndicatorFeed activeQueue](self, "activeQueue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  return (NSArray *)v3;
}

- (void)updateReuseQueue
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[_UIPageIndicatorFeed activeQueue](self, "activeQueue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4 - 1 >= 0)
  {
    do
    {
      --v4;
      -[_UIPageIndicatorFeed activeQueue](self, "activeQueue");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "objectAtIndexedSubscript:", v4);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v6, "isInvalidated"))
      {
        objc_msgSend(v6, "removeFromSuperview");
        -[_UIPageIndicatorFeed reuseQueue](self, "reuseQueue");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "addObject:", v6);

        -[_UIPageIndicatorFeed activeQueue](self, "activeQueue");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "removeObjectAtIndex:", v4);

      }
    }
    while (v4 > 0);
  }
}

- (id)indicatorForPage:(int64_t)a3 forSizeOnly:(BOOL)a4
{
  void *v7;
  void *v8;
  unint64_t v9;
  void *v10;
  unint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  unint64_t v15;
  NSObject *v16;
  NSObject *v17;
  objc_class *v18;
  void *v19;
  UIPageControl *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  NSObject *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  unint64_t v35;
  NSObject *v36;
  objc_class *v37;
  UIPageControl *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  objc_class *v46;
  UIPageControl *v47;
  objc_class *v48;
  UIPageControl *pageControl;
  uint64_t v50;
  int v51;
  void *v52;
  __int16 v53;
  UIPageControl *v54;
  __int16 v55;
  int64_t v56;
  __int16 v57;
  uint64_t v58;
  __int16 v59;
  uint64_t v60;
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  -[_UIPageIndicatorFeed activeQueue](self, "activeQueue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = a3 - objc_msgSend(v8, "page");

  if ((v9 & 0x8000000000000000) != 0
    || (-[_UIPageIndicatorFeed activeQueue](self, "activeQueue"),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        v11 = objc_msgSend(v10, "count"),
        v10,
        v9 >= v11))
  {
    -[_UIPageIndicatorFeed reuseQueue](self, "reuseQueue");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "lastObject");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (v22)
    {
      -[_UIPageIndicatorFeed reuseQueue](self, "reuseQueue");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "lastObject");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      -[_UIPageIndicatorFeed reuseQueue](self, "reuseQueue");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "removeLastObject");

    }
    else
    {
      v13 = (void *)objc_opt_new();
    }
    -[_UIPageIndicatorFeed delegate](self, "delegate");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "configureIndicatorImagesForIndicator:atPage:", v13, a3);

    if (a4)
    {
      objc_msgSend(v13, "sizeToFit");
      objc_msgSend(v13, "invalidate");
      -[_UIPageIndicatorFeed reuseQueue](self, "reuseQueue");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v13, "setPage:", a3);
      -[_UIPageIndicatorFeed delegate](self, "delegate");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "configureIndicator:atPage:", v13, a3);

      -[_UIPageIndicatorFeed activeQueue](self, "activeQueue");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "firstObject");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = objc_msgSend(v29, "page") - 1;

      -[_UIPageIndicatorFeed activeQueue](self, "activeQueue");
      v31 = objc_claimAutoreleasedReturnValue();
      v17 = v31;
      if (v30 == a3)
      {
        -[NSObject insertObject:atIndex:](v31, "insertObject:atIndex:", v13, 0);
LABEL_16:

        return v13;
      }
      -[NSObject lastObject](v31, "lastObject");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v32, "page") + 1 == a3)
      {

      }
      else
      {
        -[_UIPageIndicatorFeed activeQueue](self, "activeQueue");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = objc_msgSend(v33, "count");

        if (v34)
        {
          if (os_variant_has_internal_diagnostics())
          {
            __UIFaultDebugAssertLog();
            v17 = objc_claimAutoreleasedReturnValue();
            if (!os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
              goto LABEL_16;
            v48 = (objc_class *)objc_opt_class();
            NSStringFromClass(v48);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            pageControl = self->_pageControl;
            -[_UIPageIndicatorFeed activeQueue](self, "activeQueue");
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v39, "firstObject");
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            v50 = objc_msgSend(v40, "page");
            -[_UIPageIndicatorFeed activeQueue](self, "activeQueue");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v42, "lastObject");
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            v51 = 138413314;
            v52 = v19;
            v53 = 2048;
            v54 = pageControl;
            v55 = 2048;
            v56 = a3;
            v57 = 2048;
            v58 = v50;
            v59 = 2048;
            v60 = objc_msgSend(v43, "page");
            _os_log_fault_impl(&dword_185066000, v17, OS_LOG_TYPE_FAULT, "<%@ %p>: Attempting to fetch indicator outside of queue bound. Asked for %ld, bound is in %ld..<%ld. This is a UIKit bug.", (uint8_t *)&v51, 0x34u);
          }
          else
          {
            v35 = qword_1ECD80240;
            if (!qword_1ECD80240)
            {
              v35 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
              atomic_store(v35, (unint64_t *)&qword_1ECD80240);
            }
            v36 = *(NSObject **)(v35 + 8);
            if (!os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
              return v13;
            v17 = v36;
            v37 = (objc_class *)objc_opt_class();
            NSStringFromClass(v37);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v38 = self->_pageControl;
            -[_UIPageIndicatorFeed activeQueue](self, "activeQueue");
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v39, "firstObject");
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            v41 = objc_msgSend(v40, "page");
            -[_UIPageIndicatorFeed activeQueue](self, "activeQueue");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v42, "lastObject");
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            v51 = 138413314;
            v52 = v19;
            v53 = 2048;
            v54 = v38;
            v55 = 2048;
            v56 = a3;
            v57 = 2048;
            v58 = v41;
            v59 = 2048;
            v60 = objc_msgSend(v43, "page");
            _os_log_impl(&dword_185066000, v17, OS_LOG_TYPE_ERROR, "<%@ %p>: Attempting to fetch indicator outside of queue bound. Asked for %ld, bound is in %ld..<%ld. This is a UIKit bug.", (uint8_t *)&v51, 0x34u);
          }

          goto LABEL_26;
        }
      }
      -[_UIPageIndicatorFeed activeQueue](self, "activeQueue");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v44 = v26;
    objc_msgSend(v26, "addObject:", v13);

    return v13;
  }
  -[_UIPageIndicatorFeed activeQueue](self, "activeQueue");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectAtIndexedSubscript:", v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v12) = os_variant_has_internal_diagnostics();
  v14 = objc_msgSend(v13, "page");
  if ((_DWORD)v12)
  {
    if (v14 == a3)
      return v13;
    __UIFaultDebugAssertLog();
    v17 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
      goto LABEL_16;
    v46 = (objc_class *)objc_opt_class();
    NSStringFromClass(v46);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = self->_pageControl;
    v51 = 138413058;
    v52 = v19;
    v53 = 2048;
    v54 = v47;
    v55 = 2048;
    v56 = a3;
    v57 = 2048;
    v58 = objc_msgSend(v13, "page");
    _os_log_fault_impl(&dword_185066000, v17, OS_LOG_TYPE_FAULT, "<%@ %p>: There is an inconsistency in the page control's reuse queue, expected (%ld) found (%ld). This is a UIKit bug.", (uint8_t *)&v51, 0x2Au);
    goto LABEL_26;
  }
  if (v14 != a3)
  {
    v15 = _MergedGlobals_1209;
    if (!_MergedGlobals_1209)
    {
      v15 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v15, (unint64_t *)&_MergedGlobals_1209);
    }
    v16 = *(NSObject **)(v15 + 8);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v17 = v16;
      v18 = (objc_class *)objc_opt_class();
      NSStringFromClass(v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = self->_pageControl;
      v51 = 138413058;
      v52 = v19;
      v53 = 2048;
      v54 = v20;
      v55 = 2048;
      v56 = a3;
      v57 = 2048;
      v58 = objc_msgSend(v13, "page");
      _os_log_impl(&dword_185066000, v17, OS_LOG_TYPE_ERROR, "<%@ %p>: There is an inconsistency in the page control's reuse queue, expected (%ld) found (%ld). This is a UIKit bug.", (uint8_t *)&v51, 0x2Au);
LABEL_26:

      goto LABEL_16;
    }
  }
  return v13;
}

- (NSMutableArray)activeQueue
{
  return self->_activeQueue;
}

- (NSMutableArray)reuseQueue
{
  return self->_reuseQueue;
}

- (_UIPageIndicatorFeedDelegate)delegate
{
  return (_UIPageIndicatorFeedDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (CGSize)indicatorSizeForCustomImage:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CGSize result;

  v4 = a3;
  -[_UIPageIndicatorFeed reuseQueue](self, "reuseQueue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lastObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[_UIPageIndicatorFeed reuseQueue](self, "reuseQueue");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "lastObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = (void *)objc_opt_new();
    -[_UIPageIndicatorFeed reuseQueue](self, "reuseQueue");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObject:", v8);
  }

  objc_msgSend(v8, "invalidate");
  -[_UIPageIndicatorFeed activeQueue](self, "activeQueue");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "firstObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "traitCollection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "sizeForImage:traits:", v4, v11);
  v13 = v12;
  v15 = v14;

  v16 = v13;
  v17 = v15;
  result.height = v17;
  result.width = v16;
  return result;
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (_UIPageIndicatorFeed)initWithPageControl:(id)a3
{
  UIPageControl *v4;
  _UIPageIndicatorFeed *v5;
  _UIPageIndicatorFeed *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v4 = (UIPageControl *)a3;
  v10.receiver = self;
  v10.super_class = (Class)_UIPageIndicatorFeed;
  v5 = -[_UIPageIndicatorFeed init](&v10, sel_init);
  v6 = v5;
  if (v5)
  {
    v5->_pageControl = v4;
    v7 = (void *)objc_opt_new();
    -[_UIPageIndicatorFeed setActiveQueue:](v6, "setActiveQueue:", v7);

    v8 = (void *)objc_opt_new();
    -[_UIPageIndicatorFeed setReuseQueue:](v6, "setReuseQueue:", v8);

  }
  return v6;
}

- (void)setReuseQueue:(id)a3
{
  objc_storeStrong((id *)&self->_reuseQueue, a3);
}

- (void)setActiveQueue:(id)a3
{
  objc_storeStrong((id *)&self->_activeQueue, a3);
}

- (void)reloadIndicatorImageForPage:(int64_t)a3
{
  void *v5;
  id v6;

  if (-[_UIPageIndicatorFeed _isPageWithinActiveBounds:](self, "_isPageWithinActiveBounds:"))
  {
    -[_UIPageIndicatorFeed indicatorForPage:](self, "indicatorForPage:", a3);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    -[_UIPageIndicatorFeed delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "configureIndicatorImagesForIndicator:atPage:", v6, objc_msgSend(v6, "page"));

    objc_msgSend(v6, "sizeToFit");
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reuseQueue, 0);
  objc_storeStrong((id *)&self->_activeQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)invalidateIndicators
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[_UIPageIndicatorFeed activeQueue](self, "activeQueue", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        objc_msgSend(v8, "invalidate");
        objc_msgSend(v8, "removeFromSuperview");
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v5);
  }

  -[_UIPageIndicatorFeed reuseQueue](self, "reuseQueue");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIPageIndicatorFeed activeQueue](self, "activeQueue");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObjectsFromArray:", v10);

  -[_UIPageIndicatorFeed activeQueue](self, "activeQueue");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "removeAllObjects");

}

- (void)reloadIndicatorImages
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[_UIPageIndicatorFeed activeQueue](self, "activeQueue", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * v7);
        -[_UIPageIndicatorFeed delegate](self, "delegate");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "configureIndicatorImagesForIndicator:atPage:", v8, objc_msgSend(v8, "page"));

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }

}

- (CGSize)indicatorSizeForPage:(int64_t)a3
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGSize result;

  -[_UIPageIndicatorFeed indicatorForPage:forSizeOnly:](self, "indicatorForPage:forSizeOnly:", a3, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;

  v8 = v5;
  v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

@end
