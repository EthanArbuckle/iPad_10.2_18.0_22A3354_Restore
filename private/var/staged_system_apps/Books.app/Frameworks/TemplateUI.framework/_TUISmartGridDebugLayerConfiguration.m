@implementation _TUISmartGridDebugLayerConfiguration

- (_TUISmartGridDebugLayerConfiguration)initWithSize:(CGSize)a3 columnSystem:(const ColumnSystem *)a4
{
  CGFloat height;
  CGFloat width;
  _TUISmartGridDebugLayerConfiguration *result;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  objc_super v14;

  height = a3.height;
  width = a3.width;
  v14.receiver = self;
  v14.super_class = (Class)_TUISmartGridDebugLayerConfiguration;
  result = -[_TUISmartGridDebugLayerConfiguration init](&v14, "init");
  if (result)
  {
    result->_size.width = width;
    result->_size.height = height;
    v8 = *(_OWORD *)&a4->_containerWidth;
    v9 = *(_OWORD *)&a4->_rows;
    v10 = *(_OWORD *)&a4->_insets.left;
    *(_OWORD *)&result->_columnSystem._insets.right = *(_OWORD *)&a4->_insets.right;
    *(_OWORD *)&result->_columnSystem._insets.left = v10;
    *(_OWORD *)&result->_columnSystem._rows = v9;
    *(_OWORD *)&result->_columnSystem._containerWidth = v8;
    v11 = *(_OWORD *)&a4->_specifiedColumnSpacing;
    v12 = *(_OWORD *)&a4->_computedColumnSpacing;
    v13 = *(_OWORD *)&a4->_layoutDirection;
    result->_columnSystem._columnsPerPage = a4->_columnsPerPage;
    *(_OWORD *)&result->_columnSystem._layoutDirection = v13;
    *(_OWORD *)&result->_columnSystem._computedColumnSpacing = v12;
    *(_OWORD *)&result->_columnSystem._specifiedColumnSpacing = v11;
  }
  return result;
}

- (Class)layerClass
{
  return (Class)objc_opt_class(CALayer, a2);
}

- (Class)layerClassForSize:(CGSize)a3
{
  return (Class)objc_opt_class(CALayer, a2);
}

- (void)configureLayer:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  NSMutableArray *v9;
  unint64_t v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  id v15;

  v15 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor redColor](UIColor, "redColor"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "colorWithAlphaComponent:", 0.1));

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor redColor](UIColor, "redColor"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "colorWithAlphaComponent:", 0.2));

  v8 = objc_retainAutorelease(v5);
  objc_msgSend(v15, "setBackgroundColor:", objc_msgSend(v8, "CGColor"));
  v9 = objc_opt_new(NSMutableArray);
  if (self->_columnSystem._columns)
  {
    v10 = 0;
    do
    {
      sub_66124((uint64_t)&self->_columnSystem, v10, 1uLL, 1);
      v12 = v11;
      v13 = sub_5F85C((uint64_t)&self->_columnSystem, v10, 1uLL);
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[CALayer layer](CALayer, "layer"));
      objc_msgSend(v14, "setBackgroundColor:", objc_msgSend(objc_retainAutorelease(v7), "CGColor"));
      objc_msgSend(v14, "setFrame:", v12, 0.0, v12 + v13 - v12, self->_size.height);
      -[NSMutableArray addObject:](v9, "addObject:", v14);

      ++v10;
    }
    while (v10 < self->_columnSystem._columns);
  }
  objc_msgSend(v15, "setSublayers:", v9);

}

- (void)configureBounds:(id)a3
{
  objc_msgSend(a3, "setBounds:", 0.0, 0.0, self->_size.width, self->_size.height);
}

- (BOOL)isEqualToConfig:(id)a3
{
  return 0;
}

- (BOOL)reuseLayerForBoundsChange
{
  return 1;
}

- (CGSize)size
{
  double width;
  double height;
  CGSize result;

  width = self->_size.width;
  height = self->_size.height;
  result.height = height;
  result.width = width;
  return result;
}

- (id).cxx_construct
{
  __int128 v2;

  *((_QWORD *)self + 2) = 0;
  *((_QWORD *)self + 3) = 0;
  *((_QWORD *)self + 1) = 0;
  v2 = *(_OWORD *)&UIEdgeInsetsZero.bottom;
  *((_OWORD *)self + 2) = *(_OWORD *)&UIEdgeInsetsZero.top;
  *((_OWORD *)self + 3) = v2;
  *((_QWORD *)self + 15) = 0;
  *((_QWORD *)self + 8) = 0;
  *((_QWORD *)self + 9) = 0;
  *((_QWORD *)self + 12) = 0;
  *((_QWORD *)self + 13) = 0;
  return self;
}

@end
