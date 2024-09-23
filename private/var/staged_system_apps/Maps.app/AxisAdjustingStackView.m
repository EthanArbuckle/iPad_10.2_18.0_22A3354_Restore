@implementation AxisAdjustingStackView

- (AxisAdjustingStackView)initWithFrame:(CGRect)a3
{
  AxisAdjustingStackView *v3;
  AxisAdjustingStackView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AxisAdjustingStackView;
  v3 = -[AxisAdjustingStackView initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[AxisAdjustingStackView _commonInit](v3, "_commonInit");
  return v4;
}

- (void)dealloc
{
  id v3;
  NSObject *v4;
  objc_super v5;
  uint8_t buf[4];
  AxisAdjustingStackView *v7;

  v3 = sub_1007F800C();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134349056;
    v7 = self;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "[%{public}p] Deallocating", buf, 0xCu);
  }

  v5.receiver = self;
  v5.super_class = (Class)AxisAdjustingStackView;
  -[AxisAdjustingStackView dealloc](&v5, "dealloc");
}

- (AxisAdjustingStackView)initWithArrangedTruncatableSubviews:(id)a3
{
  id v4;
  AxisAdjustingStackView *v5;
  AxisAdjustingStackView *v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  objc_super v17;
  _BYTE v18[128];

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)AxisAdjustingStackView;
  v5 = -[AxisAdjustingStackView init](&v17, "init");
  v6 = v5;
  if (v5)
  {
    -[AxisAdjustingStackView _commonInit](v5, "_commonInit");
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v7 = v4;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v14;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v14 != v10)
            objc_enumerationMutation(v7);
          -[AxisAdjustingStackView addArrangedTruncatableSubview:](v6, "addArrangedTruncatableSubview:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)v11), (_QWORD)v13);
          v11 = (char *)v11 + 1;
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
      }
      while (v9);
    }

  }
  return v6;
}

- (void)_commonInit
{
  id v3;
  NSObject *v4;
  NSHashTable *v5;
  NSHashTable *truncatableViews;
  int v7;
  AxisAdjustingStackView *v8;

  v3 = sub_1007F800C();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v7 = 134349056;
    v8 = self;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "[%{public}p] Initializing", (uint8_t *)&v7, 0xCu);
  }

  -[AxisAdjustingStackView setAxis:](self, "setAxis:", 0);
  v5 = (NSHashTable *)objc_msgSend(objc_alloc((Class)NSHashTable), "initWithOptions:capacity:", 0, 0);
  truncatableViews = self->_truncatableViews;
  self->_truncatableViews = v5;

  self->_previousWidth = NAN;
}

- (void)layoutIfNeeded
{
  id v3;
  double v4;
  double v5;
  id v6;
  NSObject *v7;
  double previousWidth;
  objc_super v9;
  uint8_t buf[4];
  AxisAdjustingStackView *v11;
  __int16 v12;
  double v13;
  __int16 v14;
  double v15;

  v9.receiver = self;
  v9.super_class = (Class)AxisAdjustingStackView;
  -[AxisAdjustingStackView layoutIfNeeded](&v9, "layoutIfNeeded");
  v3 = -[AxisAdjustingStackView frame](self, "frame");
  v5 = v4;
  if (!CGFloatIsValid(v3, self->_previousWidth) || vabdd_f64(self->_previousWidth, v5) > 2.22044605e-16)
  {
    v6 = sub_1007F800C();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      previousWidth = self->_previousWidth;
      *(_DWORD *)buf = 134349568;
      v11 = self;
      v12 = 2048;
      v13 = previousWidth;
      v14 = 2048;
      v15 = v5;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "[%{public}p] Width changed from %f to %f", buf, 0x20u);
    }

    self->_previousWidth = v5;
    -[AxisAdjustingStackView _forceUpdateStackViewAlignment](self, "_forceUpdateStackViewAlignment");
  }
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  _QWORD block[5];
  objc_super v14;
  uint8_t buf[4];
  AxisAdjustingStackView *v16;
  __int16 v17;
  void *v18;

  v14.receiver = self;
  v14.super_class = (Class)AxisAdjustingStackView;
  v4 = a3;
  -[AxisAdjustingStackView traitCollectionDidChange:](&v14, "traitCollectionDidChange:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[AxisAdjustingStackView traitCollection](self, "traitCollection"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "preferredContentSizeCategory"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "preferredContentSizeCategory"));

  v8 = sub_1002A8950(v6, v7);
  if (v8)
  {
    v9 = sub_1007F800C();
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[AxisAdjustingStackView traitCollection](self, "traitCollection"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "preferredContentSizeCategory"));
      *(_DWORD *)buf = 134349314;
      v16 = self;
      v17 = 2112;
      v18 = v12;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "[%{public}p] Preferred content size category changed to %@", buf, 0x16u);

    }
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1007F8528;
    block[3] = &unk_1011AC860;
    block[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
}

- (void)addTruncatableView:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  int v7;
  AxisAdjustingStackView *v8;
  __int16 v9;
  id v10;

  v4 = a3;
  if (!-[NSHashTable containsObject:](self->_truncatableViews, "containsObject:", v4))
  {
    v5 = sub_1007F800C();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v7 = 134349314;
      v8 = self;
      v9 = 2112;
      v10 = v4;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[%{public}p] Adding truncatable view: %@", (uint8_t *)&v7, 0x16u);
    }

    -[NSHashTable addObject:](self->_truncatableViews, "addObject:", v4);
    -[AxisAdjustingStackView _forceUpdateStackViewAlignment](self, "_forceUpdateStackViewAlignment");
  }

}

- (void)removeTruncatableView:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  int v7;
  AxisAdjustingStackView *v8;
  __int16 v9;
  id v10;

  v4 = a3;
  if (-[NSHashTable containsObject:](self->_truncatableViews, "containsObject:", v4))
  {
    v5 = sub_1007F800C();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v7 = 134349314;
      v8 = self;
      v9 = 2112;
      v10 = v4;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[%{public}p] Removing truncatable view: %@", (uint8_t *)&v7, 0x16u);
    }

    -[NSHashTable removeObject:](self->_truncatableViews, "removeObject:", v4);
    -[AxisAdjustingStackView _forceUpdateStackViewAlignment](self, "_forceUpdateStackViewAlignment");
  }

}

- (void)addArrangedTruncatableSubview:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  int v7;
  AxisAdjustingStackView *v8;
  __int16 v9;
  id v10;

  v4 = a3;
  v5 = sub_1007F800C();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = 134349314;
    v8 = self;
    v9 = 2112;
    v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[%{public}p] Adding arranged truncatable subview: %@", (uint8_t *)&v7, 0x16u);
  }

  -[AxisAdjustingStackView addArrangedSubview:](self, "addArrangedSubview:", v4);
  -[AxisAdjustingStackView addTruncatableView:](self, "addTruncatableView:", v4);

}

- (void)insertArrangedTruncatableSubview:(id)a3 atIndex:(unint64_t)a4
{
  id v6;
  id v7;
  NSObject *v8;
  int v9;
  AxisAdjustingStackView *v10;
  __int16 v11;
  id v12;
  __int16 v13;
  unint64_t v14;

  v6 = a3;
  v7 = sub_1007F800C();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = 134349570;
    v10 = self;
    v11 = 2112;
    v12 = v6;
    v13 = 2048;
    v14 = a4;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "[%{public}p] Inserting arranged truncatable subview: %@ at index: %lu", (uint8_t *)&v9, 0x20u);
  }

  -[AxisAdjustingStackView insertArrangedSubview:atIndex:](self, "insertArrangedSubview:atIndex:", v6, a4);
  -[AxisAdjustingStackView addTruncatableView:](self, "addTruncatableView:", v6);

}

- (void)removeArrangedTruncatableSubview:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  int v7;
  AxisAdjustingStackView *v8;
  __int16 v9;
  id v10;

  v4 = a3;
  v5 = sub_1007F800C();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = 134349314;
    v8 = self;
    v9 = 2112;
    v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[%{public}p] Removing arranged truncatable subview: %@", (uint8_t *)&v7, 0x16u);
  }

  -[AxisAdjustingStackView removeArrangedSubview:](self, "removeArrangedSubview:", v4);
  -[AxisAdjustingStackView removeTruncatableView:](self, "removeTruncatableView:", v4);

}

- (void)invalidateStackViewAxis
{
  self->_calculatedIdealEndRouteButtonStackViewAxis = 0;
}

- (void)updateStackViewAxisIfNeeded
{
  id v3;
  NSObject *v4;
  NSHashTable *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  id v11;
  NSObject *v12;
  NSObject *v13;
  const char *v14;
  unsigned int v15;
  id v16;
  _BOOL4 v17;
  id WeakRetained;
  id v19;
  NSObject *v20;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t buf[4];
  AxisAdjustingStackView *v27;
  __int16 v28;
  void *v29;
  _BYTE v30[128];

  if (self->_calculatedIdealEndRouteButtonStackViewAxis || !-[NSHashTable count](self->_truncatableViews, "count"))
    return;
  v3 = sub_1007F800C();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134349056;
    v27 = self;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "[%{public}p] Updating stack view alignment", buf, 0xCu);
  }

  v21 = -[AxisAdjustingStackView axis](self, "axis");
  -[AxisAdjustingStackView setAxis:](self, "setAxis:", 0);
  -[AxisAdjustingStackView setNeedsLayout](self, "setNeedsLayout");
  -[AxisAdjustingStackView layoutIfNeeded](self, "layoutIfNeeded");
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v5 = self->_truncatableViews;
  v6 = -[NSHashTable countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
  if (!v6)
    goto LABEL_23;
  v7 = v6;
  v8 = *(_QWORD *)v23;
  while (2)
  {
    for (i = 0; i != v7; i = (char *)i + 1)
    {
      if (*(_QWORD *)v23 != v8)
        objc_enumerationMutation(v5);
      v10 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)i);
      if (objc_msgSend(v10, "isHiddenOrHasHiddenAncestor"))
      {
        v11 = sub_1007F800C();
        v12 = objc_claimAutoreleasedReturnValue(v11);
        if (!os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
          goto LABEL_17;
        *(_DWORD *)buf = 134349314;
        v27 = self;
        v28 = 2112;
        v29 = v10;
        v13 = v12;
        v14 = "[%{public}p] View or ancestor is hidden; ignoring: %@";
        goto LABEL_16;
      }
      v15 = objc_msgSend(v10, "isTextTruncatedIgnoringLeading:", 1);
      v16 = sub_1007F800C();
      v12 = objc_claimAutoreleasedReturnValue(v16);
      v17 = os_log_type_enabled(v12, OS_LOG_TYPE_INFO);
      if (v15)
      {
        if (v17)
        {
          *(_DWORD *)buf = 134349314;
          v27 = self;
          v28 = 2112;
          v29 = v10;
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "[%{public}p] View is truncated: %@", buf, 0x16u);
        }

        -[AxisAdjustingStackView setAxis:](self, "setAxis:", 1);
        goto LABEL_23;
      }
      if (v17)
      {
        *(_DWORD *)buf = 134349314;
        v27 = self;
        v28 = 2112;
        v29 = v10;
        v13 = v12;
        v14 = "[%{public}p] View is NOT truncated: %@";
LABEL_16:
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, v14, buf, 0x16u);
      }
LABEL_17:

    }
    v7 = -[NSHashTable countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
    if (v7)
      continue;
    break;
  }
LABEL_23:

  self->_calculatedIdealEndRouteButtonStackViewAxis = 1;
  if (v21 != -[AxisAdjustingStackView axis](self, "axis"))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "stackViewDidChangeLayout:", self);

  }
  v19 = sub_1007F800C();
  v20 = objc_claimAutoreleasedReturnValue(v19);
  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134349056;
    v27 = self;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "[%{public}p] Finished updating stack view alignment", buf, 0xCu);
  }

}

- (void)_forceUpdateStackViewAlignment
{
  self->_calculatedIdealEndRouteButtonStackViewAxis = 0;
  -[AxisAdjustingStackView updateStackViewAxisIfNeeded](self, "updateStackViewAxisIfNeeded");
}

- (AxisAdjustingStackViewDelegate)delegate
{
  return (AxisAdjustingStackViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)hasCalculatedIdealEndRouteButtonStackViewAxis
{
  return self->_calculatedIdealEndRouteButtonStackViewAxis;
}

- (void)setCalculatedIdealEndRouteButtonStackViewAxis:(BOOL)a3
{
  self->_calculatedIdealEndRouteButtonStackViewAxis = a3;
}

- (double)previousWidth
{
  return self->_previousWidth;
}

- (void)setPreviousWidth:(double)a3
{
  self->_previousWidth = a3;
}

- (NSHashTable)truncatableViews
{
  return self->_truncatableViews;
}

- (void)setTruncatableViews:(id)a3
{
  objc_storeStrong((id *)&self->_truncatableViews, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_truncatableViews, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
