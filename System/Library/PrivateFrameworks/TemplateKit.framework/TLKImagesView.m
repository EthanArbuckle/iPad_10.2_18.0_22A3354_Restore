@implementation TLKImagesView

- (id)setupContentView
{
  NSMutableArray *v3;
  NSMutableArray *imageButtons;
  void *v5;

  v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  imageButtons = self->_imageButtons;
  self->_imageButtons = v3;

  v5 = (void *)objc_opt_new();
  objc_msgSend(v5, "setHorizontalAlignment:", 3);
  objc_msgSend(v5, "setHorizontalDistribution:", 7);
  objc_msgSend(v5, "setVerticalAlignment:", 1);
  objc_msgSend(v5, "setDelegate:", self);
  +[TLKView makeContainerShadowCompatible:](TLKView, "makeContainerShadowCompatible:", v5);
  +[TLKView makeContainerShadowCompatible:](TLKView, "makeContainerShadowCompatible:", self);
  return v5;
}

- (BOOL)usesDefaultLayoutMargins
{
  return 0;
}

- (void)setImages:(id)a3
{
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  NSArray *v10;

  v10 = (NSArray *)a3;
  if (self->_images != v10)
  {
    objc_storeStrong((id *)&self->_images, a3);
    -[TLKView observer](self, "observer");
    v5 = objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = (void *)v5;
      -[TLKView observer](self, "observer");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "batchUpdateCount");

      if (!v8)
      {
        -[TLKView observer](self, "observer");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "propertiesDidChange");

      }
    }
  }

}

- (void)setPaddingDisabled:(BOOL)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;

  if (self->_paddingDisabled != a3)
  {
    self->_paddingDisabled = a3;
    -[TLKView observer](self, "observer");
    v4 = objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v5 = (void *)v4;
      -[TLKView observer](self, "observer");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "batchUpdateCount");

      if (!v7)
      {
        -[TLKView observer](self, "observer");
        v8 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "propertiesDidChange");

      }
    }
  }
}

- (void)setSelectionEnabled:(BOOL)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;

  if (self->_selectionEnabled != a3)
  {
    self->_selectionEnabled = a3;
    -[TLKView observer](self, "observer");
    v4 = objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v5 = (void *)v4;
      -[TLKView observer](self, "observer");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "batchUpdateCount");

      if (!v7)
      {
        -[TLKView observer](self, "observer");
        v8 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "propertiesDidChange");

      }
    }
  }
}

- (void)observedPropertiesChanged
{
  _BOOL8 v3;
  void *v4;
  void *v5;
  id v6;

  -[TLKImagesView _updateImages](self, "_updateImages");
  -[TLKImagesView _updateSpacing](self, "_updateSpacing");
  -[TLKImagesView images](self, "images");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v6, "count") == 1 && -[TLKImagesView isPaddingDisabled](self, "isPaddingDisabled");
  -[TLKImagesView imageButtons](self, "imageButtons");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAlwaysShowPlaceholderView:", v3);

}

- (void)_updateSpacing
{
  double v3;
  void *v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  id v15;

  if (-[TLKImagesView isPaddingDisabled](self, "isPaddingDisabled"))
    v3 = 0.0;
  else
    v3 = 6.0;
  -[TLKView contentView](self, "contentView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setItemSpacing:", v3);

  if (-[TLKImagesView isPaddingDisabled](self, "isPaddingDisabled"))
    v5 = 0.0;
  else
    v5 = 6.0;
  -[TLKView contentView](self, "contentView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setRowSpacing:", v5);

  if (-[TLKImagesView isPaddingDisabled](self, "isPaddingDisabled"))
  {
    v7 = *MEMORY[0x1E0DC49E8];
    v8 = *(double *)(MEMORY[0x1E0DC49E8] + 8);
    v9 = *(double *)(MEMORY[0x1E0DC49E8] + 16);
    v10 = *(double *)(MEMORY[0x1E0DC49E8] + 24);
  }
  else
  {
    +[TLKLayoutUtilities deviceScaledRoundedValue:forView:](TLKLayoutUtilities, "deviceScaledRoundedValue:forView:", self, 6.0);
    v7 = v11;
    +[TLKLayoutUtilities deviceScaledRoundedValue:forView:](TLKLayoutUtilities, "deviceScaledRoundedValue:forView:", self, 6.0);
    v8 = v12;
    +[TLKLayoutUtilities deviceScaledRoundedValue:forView:](TLKLayoutUtilities, "deviceScaledRoundedValue:forView:", self, 6.0);
    v9 = v13;
    +[TLKLayoutUtilities deviceScaledRoundedValue:forView:](TLKLayoutUtilities, "deviceScaledRoundedValue:forView:", self, 6.0);
    v10 = v14;
  }
  -[TLKView contentView](self, "contentView");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setLayoutMargins:", v7, v8, v9, v10);

}

- (void)_updateImages
{
  uint64_t v3;
  void *v4;
  unint64_t v5;
  void *v6;
  void *v7;
  unint64_t v8;
  void *v9;
  unint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  unint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  unint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  unint64_t v27;

  if (-[TLKImagesView useGridAlignment](self, "useGridAlignment"))
  {
    v3 = 4;
  }
  else
  {
    -[TLKImagesView images](self, "images");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "count");

    if (v5 >= 4)
      v3 = 4;
    else
      v3 = v5;
  }
  -[TLKView contentView](self, "contentView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setNumberOfColumns:", v3);

  -[TLKImagesView imageButtons](self, "imageButtons");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  -[TLKImagesView images](self, "images");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");

  if (v8 < v10)
  {
    do
    {
      v11 = (void *)objc_opt_new();
      objc_msgSend(v11, "setMatchesHeightForAlignmentRectWithIntrinsicContentSize:", 0);
      objc_msgSend(v11, "addTarget:action:", self, sel__handleTap_);
      -[TLKImagesView imageButtons](self, "imageButtons");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "addObject:", v11);

      ++v8;
      -[TLKImagesView images](self, "images");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "count");

    }
    while (v8 < v14);
  }
  -[TLKImagesView imageButtons](self, "imageButtons");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[TLKImagesView images](self, "images");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "subarrayWithRange:", 0, objc_msgSend(v16, "count"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[TLKView contentView](self, "contentView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setArrangedSubviews:", v17);

  -[TLKImagesView images](self, "images");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "count");

  if (v20)
  {
    v21 = 0;
    do
    {
      -[TLKImagesView imageButtons](self, "imageButtons");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "objectAtIndexedSubscript:", v21);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      -[TLKImagesView images](self, "images");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "objectAtIndexedSubscript:", v21);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "setTlkImage:", v25);

      objc_msgSend(v23, "setEnabled:", -[TLKImagesView isSelectionEnabled](self, "isSelectionEnabled"));
      ++v21;
      -[TLKImagesView images](self, "images");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(v26, "count");

    }
    while (v21 < v27);
  }
}

- (void)_handleTap:(id)a3
{
  TLKImagesViewDelegate **p_delegate;
  id v5;
  void *v6;
  id WeakRetained;

  p_delegate = &self->_delegate;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(v5, "tlkImage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(WeakRetained, "imagesView:didSelectImage:", self, v6);
}

- (id)imageViewAtLocation:(CGPoint)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  -[TLKImagesView hitTest:withEvent:](self, "hitTest:withEvent:", 0, a3.x, a3.y);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[TLKImagesView imageButtons](self, "imageButtons", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v11;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v5);
        if (v4 == *(void **)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)i))
        {
          objc_msgSend(v4, "tlkImageView");
          v6 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_11;
        }
      }
      v6 = (void *)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (TLKImagesViewDelegate)delegate
{
  return (TLKImagesViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSArray)images
{
  return self->_images;
}

- (BOOL)isPaddingDisabled
{
  return self->_paddingDisabled;
}

- (BOOL)isSelectionEnabled
{
  return self->_selectionEnabled;
}

- (BOOL)useGridAlignment
{
  return self->_useGridAlignment;
}

- (void)setUseGridAlignment:(BOOL)a3
{
  self->_useGridAlignment = a3;
}

- (NSMutableArray)imageButtons
{
  return self->_imageButtons;
}

- (void)setImageButtons:(id)a3
{
  objc_storeStrong((id *)&self->_imageButtons, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageButtons, 0);
  objc_storeStrong((id *)&self->_images, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
