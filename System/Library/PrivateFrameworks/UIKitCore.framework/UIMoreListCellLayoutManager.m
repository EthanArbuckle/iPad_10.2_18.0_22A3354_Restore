@implementation UIMoreListCellLayoutManager

- (void)layoutSubviewsOfCell:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v4 = a3;
  objc_msgSend(v4, "imageView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setContentMode:", 4);

  v6.receiver = self;
  v6.super_class = (Class)UIMoreListCellLayoutManager;
  -[UITableViewCellLayoutManager layoutSubviewsOfCell:](&v6, sel_layoutSubviewsOfCell_, v4);

}

- (CGRect)standardLayoutImageViewFrameForCell:(id)a3 forSizing:(BOOL)a4
{
  _BOOL8 v4;
  _DWORD *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double widestImageWidth;
  void *v15;
  CGFloat v16;
  double v17;
  double v18;
  double v19;
  double v20;
  objc_super v21;
  CGRect v22;
  CGRect v23;
  CGRect result;

  v4 = a4;
  v6 = a3;
  v21.receiver = self;
  v21.super_class = (Class)UIMoreListCellLayoutManager;
  -[UITableViewCellLayoutManager standardLayoutImageViewFrameForCell:forSizing:](&v21, sel_standardLayoutImageViewFrameForCell_forSizing_, v6, v4);
  v9 = v8;
  v11 = v10;
  v13 = v12;
  widestImageWidth = self->_widestImageWidth;
  if (widestImageWidth <= 0.00000011920929)
  {
    widestImageWidth = v7;
  }
  else if ((v6[30] & 0x80000) != 0)
  {
    objc_msgSend(v6, "contentView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "bounds");
    v16 = CGRectGetMaxX(v22) + -15.0;
    v23.origin.x = v9;
    v23.origin.y = v11;
    v23.size.width = widestImageWidth;
    v23.size.height = v13;
    v9 = v16 - CGRectGetWidth(v23);

  }
  else
  {
    v9 = 15.0;
  }

  v17 = v9;
  v18 = v11;
  v19 = widestImageWidth;
  v20 = v13;
  result.size.height = v20;
  result.size.width = v19;
  result.origin.y = v18;
  result.origin.x = v17;
  return result;
}

- (double)setWidestImageWidthFromViewControllers:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  double widestImageWidth;
  double v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  self->_widestImageWidth = 0.0;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v20 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        __UIMoreListImageForViewController(0, v9, 0);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = v10;
        if (v10)
        {
          widestImageWidth = self->_widestImageWidth;
          objc_msgSend(v10, "size");
          if (widestImageWidth >= v13)
            v13 = widestImageWidth;
          self->_widestImageWidth = v13;
        }
        __UIMoreListImageForViewController(0, v9, 1);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (v14)
        {
          v15 = self->_widestImageWidth;
          objc_msgSend(v14, "size");
          if (v15 >= v16)
            v16 = v15;
          self->_widestImageWidth = v16;
        }

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v6);
  }
  v17 = self->_widestImageWidth;

  return v17;
}

@end
