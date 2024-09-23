@implementation MultilineWrappingListView

- (MultilineWrappingListView)initWithCoder:(id)a3
{
  MultilineWrappingListView *v3;
  MultilineWrappingListView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MultilineWrappingListView;
  v3 = -[MultilineWrappingListView initWithCoder:](&v6, "initWithCoder:", a3);
  v4 = v3;
  if (v3)
    -[MultilineWrappingListView _commonInit](v3, "_commonInit");
  return v4;
}

- (MultilineWrappingListView)initWithFrame:(CGRect)a3
{
  MultilineWrappingListView *v3;
  MultilineWrappingListView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MultilineWrappingListView;
  v3 = -[MultilineWrappingListView initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[MultilineWrappingListView _commonInit](v3, "_commonInit");
  return v4;
}

- (void)_commonInit
{
  NSMutableArray *v3;
  NSMutableArray *items;
  CGFloat v5;
  CGFloat v6;
  CGFloat v7;
  CGFloat v8;

  v3 = objc_opt_new(NSMutableArray);
  items = self->_items;
  self->_items = v3;

  -[MultilineWrappingListView frame](self, "frame");
  self->_previousFrame.origin.x = v5;
  self->_previousFrame.origin.y = v6;
  self->_previousFrame.size.width = v7;
  self->_previousFrame.size.height = v8;
}

- (unint64_t)numberOfLines
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  CGRect v13;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MultilineWrappingListView cachedNumberOfLines](self, "cachedNumberOfLines"));

  if (!v3)
  {
    v9 = 0;
    v10 = &v9;
    v11 = 0x2020000000;
    v12 = 0;
    -[MultilineWrappingListView bounds](self, "bounds");
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100B04448;
    v8[3] = &unk_1011E2888;
    v8[4] = &v9;
    -[MultilineWrappingListView _enumerateLinesForPreferredMaxLayoutWidth:block:](self, "_enumerateLinesForPreferredMaxLayoutWidth:block:", v8, CGRectGetWidth(v13));
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v10[3]));
    -[MultilineWrappingListView setCachedNumberOfLines:](self, "setCachedNumberOfLines:", v4);

    _Block_object_dispose(&v9, 8);
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MultilineWrappingListView cachedNumberOfLines](self, "cachedNumberOfLines"));
  v6 = objc_msgSend(v5, "unsignedIntegerValue");

  return (unint64_t)v6;
}

- (double)singleLineWidth
{
  void *v3;
  void *v4;
  void *v5;
  float v6;
  double v7;
  _QWORD v9[5];
  uint64_t v10;
  double *v11;
  uint64_t v12;
  uint64_t v13;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MultilineWrappingListView cachedSingleLineWidth](self, "cachedSingleLineWidth"));

  if (!v3)
  {
    v10 = 0;
    v11 = (double *)&v10;
    v12 = 0x2020000000;
    v13 = 0;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100B0456C;
    v9[3] = &unk_1011E2888;
    v9[4] = &v10;
    -[MultilineWrappingListView _enumerateLinesForPreferredMaxLayoutWidth:block:](self, "_enumerateLinesForPreferredMaxLayoutWidth:block:", v9, 3.40282347e38);
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v11[3]));
    -[MultilineWrappingListView setCachedSingleLineWidth:](self, "setCachedSingleLineWidth:", v4);

    _Block_object_dispose(&v10, 8);
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MultilineWrappingListView cachedSingleLineWidth](self, "cachedSingleLineWidth"));
  objc_msgSend(v5, "floatValue");
  v7 = v6;

  return v7;
}

- (void)addArrangedSubview:(id)a3
{
  -[MultilineWrappingListView _addArrangedSubview:horizontalSpacing:](self, "_addArrangedSubview:horizontalSpacing:", a3, 0);
}

- (void)addArrangedSubview:(id)a3 withCustomHorizontalSpacing:(double)a4
{
  id v6;
  id v7;

  v6 = a3;
  v7 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", a4));
  -[MultilineWrappingListView _addArrangedSubview:horizontalSpacing:](self, "_addArrangedSubview:horizontalSpacing:", v6, v7);

}

- (void)_addArrangedSubview:(id)a3 horizontalSpacing:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  StackViewItem *v10;

  v6 = a4;
  v7 = a3;
  v10 = -[StackViewItem initWithView:horizontalSpacing:]([StackViewItem alloc], "initWithView:horizontalSpacing:", v7, v6);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MultilineWrappingListView items](self, "items"));
  objc_msgSend(v8, "addObject:", v10);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[StackViewItem view](v10, "view"));
  -[MultilineWrappingListView addSubview:](self, "addSubview:", v9);

  -[MultilineWrappingListView _invalidateLayout](self, "_invalidateLayout");
}

- (void)willRemoveSubview:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MultilineWrappingListView items](self, "items"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100B04790;
  v9[3] = &unk_1011E28B0;
  v8 = v4;
  v10 = v8;
  v6 = objc_msgSend(v5, "indexOfObjectPassingTest:", v9);

  if (v6 != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MultilineWrappingListView items](self, "items"));
    objc_msgSend(v7, "removeObjectAtIndex:", v6);

    -[MultilineWrappingListView _invalidateLayout](self, "_invalidateLayout");
  }

}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  _QWORD v9[5];
  objc_super v10;
  CGRect v11;

  v10.receiver = self;
  v10.super_class = (Class)MultilineWrappingListView;
  -[MultilineWrappingListView layoutSubviews](&v10, "layoutSubviews");
  -[MultilineWrappingListView bounds](self, "bounds");
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100B0489C;
  v9[3] = &unk_1011E28D8;
  v9[4] = self;
  -[MultilineWrappingListView _enumerateItemsForPreferredMaxLayoutWidth:block:](self, "_enumerateItemsForPreferredMaxLayoutWidth:block:", v9, CGRectGetWidth(v11));
  -[MultilineWrappingListView previousFrame](self, "previousFrame");
  v4 = v3;
  v6 = v5;
  -[MultilineWrappingListView frame](self, "frame");
  if (v4 != v8 || v6 != v7)
  {
    -[MultilineWrappingListView frame](self, "frame");
    -[MultilineWrappingListView setPreviousFrame:](self, "setPreviousFrame:");
    -[MultilineWrappingListView _invalidateFrameSize](self, "_invalidateFrameSize");
  }
}

- (CGSize)intrinsicContentSize
{
  void *v3;
  id v4;
  double Width;
  CGFloat v6;
  CGFloat v7;
  double v8;
  double v9;
  _QWORD v10[5];
  uint64_t v11;
  double *v12;
  uint64_t v13;
  const char *v14;
  CGSize v15;
  CGSize result;
  CGRect v17;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MultilineWrappingListView items](self, "items"));
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    -[MultilineWrappingListView bounds](self, "bounds");
    Width = CGRectGetWidth(v17);
    if (fabs(Width) <= 2.22044605e-16)
      Width = 1.79769313e308;
    v11 = 0;
    v12 = (double *)&v11;
    v13 = 0x3010000000;
    v14 = "";
    v15 = CGSizeZero;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100B04A78;
    v10[3] = &unk_1011E2888;
    v10[4] = &v11;
    -[MultilineWrappingListView _enumerateLinesForPreferredMaxLayoutWidth:block:](self, "_enumerateLinesForPreferredMaxLayoutWidth:block:", v10, Width);
    v6 = v12[4];
    v7 = v12[5];
    _Block_object_dispose(&v11, 8);
  }
  else
  {
    v6 = UIViewNoIntrinsicMetric;
    v7 = UIViewNoIntrinsicMetric;
  }
  v8 = v6;
  v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (void)_invalidateLayout
{
  -[MultilineWrappingListView setCachedSingleLineWidth:](self, "setCachedSingleLineWidth:", 0);
  -[MultilineWrappingListView _invalidateFrameSize](self, "_invalidateFrameSize");
}

- (void)_invalidateFrameSize
{
  -[MultilineWrappingListView setCachedNumberOfLines:](self, "setCachedNumberOfLines:", 0);
  -[MultilineWrappingListView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
}

- (void)_enumerateItemsForPreferredMaxLayoutWidth:(double)a3 block:(id)a4
{
  id v5;
  _QWORD v6[4];
  MultilineWrappingListView *v7;
  id v8;

  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100B04C34;
  v6[3] = &unk_1011E2900;
  v7 = self;
  v8 = a4;
  v5 = v8;
  -[MultilineWrappingListView _enumerateLinesForPreferredMaxLayoutWidth:block:](v7, "_enumerateLinesForPreferredMaxLayoutWidth:block:", v6, a3);

}

- (void)_enumerateLinesForPreferredMaxLayoutWidth:(double)a3 block:(id)a4
{
  void (**v6)(id, id, double, double, double, double);
  NSMutableArray *v7;
  double y;
  double x;
  double height;
  double width;
  _QWORD *v12;
  void *v13;
  id v14;
  id v15;
  uint64_t v16;
  void *i;
  void *v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  id v32;
  double MaxY;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  id v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _QWORD v47[5];
  _BYTE v48[128];
  CGRect v49;
  CGRect v50;

  v6 = (void (**)(id, id, double, double, double, double))a4;
  v7 = objc_opt_new(NSMutableArray);
  x = CGRectZero.origin.x;
  y = CGRectZero.origin.y;
  width = CGRectZero.size.width;
  height = CGRectZero.size.height;
  v47[0] = _NSConcreteStackBlock;
  v47[1] = 3221225472;
  v47[2] = sub_100B05124;
  v47[3] = &unk_1011E2928;
  v47[4] = self;
  v12 = objc_retainBlock(v47);
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[MultilineWrappingListView items](self, "items", 0));
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v43, v48, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v44;
    do
    {
      for (i = 0; i != v15; i = (char *)i + 1)
      {
        if (*(_QWORD *)v44 != v16)
          objc_enumerationMutation(v13);
        v18 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * (_QWORD)i);
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "view"));
        objc_msgSend(v19, "_mapkit_fittingSize");
        v21 = v20;
        v23 = v22;

        if (-[NSMutableArray count](v7, "count"))
        {
          -[MultilineWrappingListView _paddingForItem:](self, "_paddingForItem:", v18);
          v21 = v21 + v24;
        }
        v49.origin.x = x;
        v49.origin.y = y;
        v49.size.width = width;
        v49.size.height = height;
        if (v21 + CGRectGetMaxX(v49) > a3)
        {
          v25 = ((double (*)(_QWORD *, double, double, double, double))v12[2])(v12, x, y, width, height);
          v27 = v26;
          v29 = v28;
          v31 = v30;
          v32 = -[NSMutableArray copy](v7, "copy");
          v6[2](v6, v32, v25, v27, v29, v31);

          v50.origin.x = v25;
          v50.origin.y = v27;
          v50.size.width = v29;
          v50.size.height = v31;
          MaxY = CGRectGetMaxY(v50);
          -[MultilineWrappingListView interlineSpacing](self, "interlineSpacing");
          y = MaxY + v34;
          -[NSMutableArray removeAllObjects](v7, "removeAllObjects");
          height = 0.0;
          width = 0.0;
          x = 0.0;
        }
        -[NSMutableArray addObject:](v7, "addObject:", v18);
        width = v21 + width;
        if (height <= v23)
          height = v23;
      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v43, v48, 16);
    }
    while (v15);
  }

  if (-[NSMutableArray count](v7, "count"))
  {
    v35 = ((double (*)(_QWORD *, double, double, double, double))v12[2])(v12, x, y, width, height);
    v37 = v36;
    v39 = v38;
    v41 = v40;
    v42 = -[NSMutableArray copy](v7, "copy");
    v6[2](v6, v42, v35, v37, v39, v41);

  }
}

- (double)_paddingForItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  float v7;
  double v8;
  double v9;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "horizontalSpacing"));
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "horizontalSpacing"));
    objc_msgSend(v6, "floatValue");
    v8 = v7;

  }
  else
  {
    -[MultilineWrappingListView horizontalSpacing](self, "horizontalSpacing");
    v8 = v9;
  }

  return v8;
}

- (double)horizontalSpacing
{
  return self->_horizontalSpacing;
}

- (void)setHorizontalSpacing:(double)a3
{
  self->_horizontalSpacing = a3;
}

- (double)interlineSpacing
{
  return self->_interlineSpacing;
}

- (void)setInterlineSpacing:(double)a3
{
  self->_interlineSpacing = a3;
}

- (double)maxLineHeight
{
  return self->_maxLineHeight;
}

- (void)setMaxLineHeight:(double)a3
{
  self->_maxLineHeight = a3;
}

- (NSMutableArray)items
{
  return self->_items;
}

- (void)setItems:(id)a3
{
  objc_storeStrong((id *)&self->_items, a3);
}

- (NSNumber)cachedNumberOfLines
{
  return self->_cachedNumberOfLines;
}

- (void)setCachedNumberOfLines:(id)a3
{
  objc_storeStrong((id *)&self->_cachedNumberOfLines, a3);
}

- (NSNumber)cachedSingleLineWidth
{
  return self->_cachedSingleLineWidth;
}

- (void)setCachedSingleLineWidth:(id)a3
{
  objc_storeStrong((id *)&self->_cachedSingleLineWidth, a3);
}

- (CGRect)previousFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_previousFrame.origin.x;
  y = self->_previousFrame.origin.y;
  width = self->_previousFrame.size.width;
  height = self->_previousFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setPreviousFrame:(CGRect)a3
{
  self->_previousFrame = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedSingleLineWidth, 0);
  objc_storeStrong((id *)&self->_cachedNumberOfLines, 0);
  objc_storeStrong((id *)&self->_items, 0);
}

@end
