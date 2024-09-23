@implementation _UIKBCompositeImageView

- (void)setImageViews:(id)a3
{
  id v5;
  void *v6;
  NSArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_storeStrong((id *)&self->_imageViews, a3);
  -[UIView subviews](self, "subviews");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "makeObjectsPerformSelector:", sel_removeFromSuperview);

  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v7 = self->_imageViews;
  v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v13;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v13 != v10)
          objc_enumerationMutation(v7);
        -[UIView addSubview:](self, "addSubview:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v11++), (_QWORD)v12);
      }
      while (v9 != v11);
      v9 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v9);
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
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  NSArray *v15;
  uint64_t v16;
  uint64_t v17;
  double v18;
  double v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  objc_super v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v27.receiver = self;
  v27.super_class = (Class)_UIKBCompositeImageView;
  -[UIView layoutSubviews](&v27, sel_layoutSubviews);
  -[UIView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[_UIKBCompositeImageView imageSize](self, "imageSize");
  v12 = v11;
  -[_UIKBCompositeImageView imageSize](self, "imageSize");
  v14 = v13;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v15 = self->_imageViews;
  v16 = -[NSArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
  if (v16)
  {
    v17 = v16;
    v18 = v4 + (v8 - v12) * 0.5;
    v19 = v6 + (v10 - v14) * 0.5;
    v20 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v24 != v20)
          objc_enumerationMutation(v15);
        v22 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        objc_msgSend(v22, "setFrame:", v18, v19, v12, v14, (_QWORD)v23);
        objc_msgSend(v22, "setContentMode:", 1);
      }
      v17 = -[NSArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    }
    while (v17);
  }

}

- (CGSize)imageSize
{
  double width;
  double height;
  CGSize result;

  width = self->_imageSize.width;
  height = self->_imageSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setImageSize:(CGSize)a3
{
  self->_imageSize = a3;
}

- (NSArray)imageViews
{
  return self->_imageViews;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageViews, 0);
}

@end
