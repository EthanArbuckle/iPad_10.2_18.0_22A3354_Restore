@implementation _TVAlertTemplateView

- (void)setBgImage:(id)a3
{
  UIImage *v4;
  UIImageView *bgImageView;
  UIImageView *v6;
  id v7;
  UIImageView *v8;
  UIImageView *v9;
  UIImage *bgImage;

  v4 = (UIImage *)a3;
  if (self->_bgImage != v4)
  {
    bgImageView = self->_bgImageView;
    if (v4)
    {
      if (bgImageView)
      {
LABEL_8:
        -[UIImageView setImage:](bgImageView, "setImage:", v4);
        goto LABEL_9;
      }
LABEL_7:
      v7 = objc_alloc(MEMORY[0x24BDF6AE8]);
      -[_TVAlertTemplateView bounds](self, "bounds");
      v8 = (UIImageView *)objc_msgSend(v7, "initWithFrame:");
      -[_TVAlertTemplateView addSubview:](self, "addSubview:", v8);
      -[_TVAlertTemplateView sendSubviewToBack:](self, "sendSubviewToBack:", v8);
      v9 = self->_bgImageView;
      self->_bgImageView = v8;

      bgImageView = self->_bgImageView;
      goto LABEL_8;
    }
    if (!bgImageView)
      goto LABEL_7;
    -[UIImageView removeFromSuperview](bgImageView, "removeFromSuperview");
    v6 = self->_bgImageView;
    self->_bgImageView = 0;

  }
LABEL_9:
  bgImage = self->_bgImage;
  self->_bgImage = v4;

}

- (void)setViewsAbove:(id)a3
{
  id v5;
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  -[NSArray makeObjectsPerformSelector:](self->_viewsAbove, "makeObjectsPerformSelector:", sel_removeFromSuperview);
  objc_storeStrong((id *)&self->_viewsAbove, a3);
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v6 = self->_viewsAbove;
  v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        -[_TVAlertTemplateView addSubview:](self, "addSubview:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v10++), (_QWORD)v11);
      }
      while (v8 != v10);
      v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

}

- (void)setViewsBelow:(id)a3
{
  id v5;
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  -[NSArray makeObjectsPerformSelector:](self->_viewsBelow, "makeObjectsPerformSelector:", sel_removeFromSuperview);
  objc_storeStrong((id *)&self->_viewsBelow, a3);
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v6 = self->_viewsBelow;
  v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        -[_TVAlertTemplateView addSubview:](self, "addSubview:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v10++), (_QWORD)v11);
      }
      while (v8 != v10);
      v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

}

- (void)setCollectionView:(id)a3
{
  UICollectionView *v5;
  UICollectionView *collectionView;
  UICollectionView *v7;

  v5 = (UICollectionView *)a3;
  collectionView = self->_collectionView;
  v7 = v5;
  if (collectionView != v5)
  {
    -[UICollectionView removeFromSuperview](collectionView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_collectionView, a3);
    if (self->_collectionView)
      -[_TVAlertTemplateView addSubview:](self, "addSubview:");
  }

}

- (void)layoutSubviews
{
  double top;
  double v4;
  double v5;
  double v6;
  double v7;
  NSArray *v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  double v12;
  uint64_t v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  NSArray *v21;
  uint64_t v22;
  uint64_t v23;
  double v24;
  double v25;
  uint64_t v26;
  double v27;
  void *v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  void *v34;
  uint64_t v35;
  double v36;
  double v37;
  uint64_t v38;
  void *v39;
  double v40;
  double v41;
  NSInteger v42;
  double v43;
  double v44;
  double Height;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  float v52;
  id v53;
  uint64_t v54;
  uint64_t v55;
  double bottom;
  CGFloat v57;
  CGFloat v58;
  CGFloat v59;
  CGFloat v60;
  _QWORD v61[14];
  _QWORD v62[5];
  id v63;
  uint64_t v64;
  double *v65;
  uint64_t v66;
  uint64_t v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  _BYTE v76[128];
  _BYTE v77[128];
  uint64_t v78;
  CGRect v79;
  CGRect v80;
  CGRect v81;

  v78 = *MEMORY[0x24BDAC8D0];
  -[_TVAlertTemplateView bounds](self, "bounds");
  top = self->_padding.top;
  bottom = self->_padding.bottom;
  v57 = v4;
  v59 = v6;
  v60 = v5;
  v58 = v7;
  -[UIImageView setFrame:](self->_bgImageView, "setFrame:");
  v74 = 0u;
  v75 = 0u;
  v72 = 0u;
  v73 = 0u;
  v8 = self->_viewsAbove;
  v9 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v72, v77, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v73;
    v11 = 0.0;
    v12 = 0.0;
    do
    {
      v13 = 0;
      v14 = v11;
      do
      {
        if (*(_QWORD *)v73 != v10)
          objc_enumerationMutation(v8);
        v15 = *(void **)(*((_QWORD *)&v72 + 1) + 8 * v13);
        objc_msgSend(v15, "tv_margin");
        v17 = v16;
        v11 = v18;
        objc_msgSend(v15, "tv_maxWidth");
        objc_msgSend(v15, "tv_sizeThatFits:");
        v20 = fmax(v17, v14);
        if (v12 == 0.0)
          v20 = 0.0;
        v12 = v19 + v12 + v20;
        ++v13;
        v14 = v11;
      }
      while (v9 != v13);
      v9 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v72, v77, 16);
    }
    while (v9);
  }
  else
  {
    v12 = 0.0;
  }

  v70 = 0u;
  v71 = 0u;
  v68 = 0u;
  v69 = 0u;
  v21 = self->_viewsBelow;
  v22 = -[NSArray countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v68, v76, 16);
  if (v22)
  {
    v23 = *(_QWORD *)v69;
    v24 = 0.0;
    v25 = 0.0;
    do
    {
      v26 = 0;
      v27 = v24;
      do
      {
        if (*(_QWORD *)v69 != v23)
          objc_enumerationMutation(v21);
        v28 = *(void **)(*((_QWORD *)&v68 + 1) + 8 * v26);
        objc_msgSend(v28, "tv_margin");
        v24 = v29;
        v31 = v30;
        objc_msgSend(v28, "tv_maxWidth");
        objc_msgSend(v28, "tv_sizeThatFits:");
        v33 = fmax(v31, v27);
        if (v25 == 0.0)
          v33 = 0.0;
        v25 = v32 + v25 + v33;
        ++v26;
        v27 = v24;
      }
      while (v22 != v26);
      v22 = -[NSArray countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v68, v76, 16);
    }
    while (v22);
  }
  else
  {
    v25 = 0.0;
  }

  -[UICollectionView collectionViewLayout](self->_collectionView, "collectionViewLayout");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "itemSize");
  v54 = v35;
  v37 = v36;

  v38 = -[UICollectionView numberOfItemsInSection:](self->_collectionView, "numberOfItemsInSection:", 0);
  -[UICollectionView collectionViewLayout](self->_collectionView, "collectionViewLayout");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "minimumLineSpacing");
  v41 = v40;
  v42 = -[UICollectionView numberOfItemsInSection:](self->_collectionView, "numberOfItemsInSection:", 0);

  if (v12 == 0.0)
    v43 = 0.0;
  else
    v43 = 50.0;
  v64 = 0;
  v65 = (double *)&v64;
  if (v25 == 0.0)
    v44 = 0.0;
  else
    v44 = 50.0;
  v66 = 0x2020000000;
  v67 = 0;
  v79.origin.y = v59;
  v79.origin.x = v60;
  v79.size.height = v57;
  v79.size.width = v58;
  Height = CGRectGetHeight(v79);
  v46 = v37 * (double)v38 + v41 * (double)(v42 - 1);
  v47 = bottom;
  if (v25 == 0.0)
    v47 = 0.0;
  if (v47 + v25 + v44 + top + v12 + v43 + v46 <= Height)
  {
    -[UICollectionView _setGradientMaskInsets:](self->_collectionView, "_setGradientMaskInsets:", *MEMORY[0x24BDF7718], *(double *)(MEMORY[0x24BDF7718] + 8), *(double *)(MEMORY[0x24BDF7718] + 16), *(double *)(MEMORY[0x24BDF7718] + 24));
    -[UICollectionView setClipsToBounds:](self->_collectionView, "setClipsToBounds:", 0);
    -[UICollectionView setContentInset:](self->_collectionView, "setContentInset:", v43, 90.0, v44, 90.0);
    -[_TVAlertTemplateView bounds](self, "bounds");
    v51 = v44 + v43 + v46;
    v52 = (CGRectGetHeight(v81) - (v25 + v12 + v51)) * 0.5;
    v65[3] = floorf(v52);
  }
  else
  {
    v65[3] = top;
    -[UICollectionView setClipsToBounds:](self->_collectionView, "setClipsToBounds:", 1);
    if (v25 == 0.0)
      v48 = 90.0;
    else
      v48 = 50.0;
    -[UICollectionView setContentInset:](self->_collectionView, "setContentInset:", 50.0, 90.0, v48, 90.0, v54);
    -[UICollectionView _setGradientMaskInsets:](self->_collectionView, "_setGradientMaskInsets:", 90.0, 0.0, 90.0, 0.0);
    v80.origin.y = v59;
    v80.origin.x = v60;
    v80.size.height = v57;
    v80.size.width = v58;
    v49 = CGRectGetHeight(v80) - top - v12;
    v50 = bottom + v25;
    if (v25 == 0.0)
      v50 = 0.0;
    v51 = v49 - v50;
  }
  v62[0] = 0;
  v62[1] = v62;
  v62[2] = 0x3032000000;
  v62[3] = __Block_byref_object_copy__1;
  v62[4] = __Block_byref_object_dispose__1;
  v63 = 0;
  v53 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  if (-[NSArray count](self->_viewsAbove, "count"))
    objc_msgSend(v53, "addObjectsFromArray:", self->_viewsAbove);
  objc_msgSend(v53, "addObject:", self->_collectionView, v54);
  if (-[NSArray count](self->_viewsBelow, "count"))
    objc_msgSend(v53, "addObjectsFromArray:", self->_viewsBelow);
  v61[0] = MEMORY[0x24BDAC760];
  v61[1] = 3221225472;
  v61[2] = __38___TVAlertTemplateView_layoutSubviews__block_invoke;
  v61[3] = &unk_24EB85FC8;
  v61[6] = &v64;
  v61[4] = self;
  v61[5] = v62;
  v61[7] = v55;
  *(double *)&v61[8] = v37;
  *(double *)&v61[9] = v51;
  *(CGFloat *)&v61[10] = v60;
  *(CGFloat *)&v61[11] = v59;
  *(CGFloat *)&v61[12] = v58;
  *(CGFloat *)&v61[13] = v57;
  objc_msgSend(v53, "enumerateObjectsUsingBlock:", v61);

  _Block_object_dispose(v62, 8);
  _Block_object_dispose(&v64, 8);
}

- (UIEdgeInsets)padding
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_padding.top;
  left = self->_padding.left;
  bottom = self->_padding.bottom;
  right = self->_padding.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setPadding:(UIEdgeInsets)a3
{
  self->_padding = a3;
}

- (NSArray)viewsAbove
{
  return self->_viewsAbove;
}

- (UICollectionView)collectionView
{
  return self->_collectionView;
}

- (NSArray)viewsBelow
{
  return self->_viewsBelow;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewsBelow, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
  objc_storeStrong((id *)&self->_viewsAbove, 0);
  objc_storeStrong((id *)&self->_bgImageView, 0);
  objc_storeStrong((id *)&self->_bgImage, 0);
}

@end
