@implementation TUToolbarDefaultCompressionAnimation

- (TUToolbarDefaultCompressionAnimation)initWithToolbar:(id)a3
{
  id v5;
  TUToolbarDefaultCompressionAnimation *v6;
  TUToolbarDefaultCompressionAnimation *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TUToolbarDefaultCompressionAnimation;
  v6 = -[TUToolbarDefaultCompressionAnimation init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_toolbar, a3);

  return v7;
}

- (void)updateWithPercentage:(double)a3
{
  void *v4;
  void *v5;
  double Height;
  double v7;
  double v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  CGAffineTransform v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  CGAffineTransform v29;
  CGAffineTransform v30;
  _BYTE v31[128];
  uint64_t v32;
  CGRect v33;

  v32 = *MEMORY[0x1E0C80C00];
  -[TUToolbarDefaultCompressionAnimation toolbar](self, "toolbar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "window");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "frame");
  Height = CGRectGetHeight(v33);
  objc_msgSend(v4, "ts_frameUsingCenterAndBounds");
  v8 = Height - v7;
  memset(&v30, 0, sizeof(v30));
  v22 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  *(_OWORD *)&v29.a = *MEMORY[0x1E0C9BAA8];
  v23 = *(_OWORD *)&v29.a;
  *(_OWORD *)&v29.c = v22;
  *(_OWORD *)&v29.tx = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  v21 = *(_OWORD *)&v29.tx;
  CGAffineTransformTranslate(&v30, &v29, 0.0, (Height - v7) * a3);
  *(_OWORD *)&v29.a = v23;
  *(_OWORD *)&v29.c = v22;
  *(_OWORD *)&v29.tx = v21;
  objc_msgSend(v4, "setTransform:", &v29);
  objc_msgSend(v4, "items");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v25, v31, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v26;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v26 != v12)
          objc_enumerationMutation(v9);
        objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * v13), "ts_barButtonItemView", v21, v22, v23);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "subviews");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "firstObject");
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        if (v16)
        {
          *(_OWORD *)&v29.a = v23;
          *(_OWORD *)&v29.c = v22;
          *(_OWORD *)&v29.tx = v21;
          objc_msgSend(v16, "setTransform:", &v29);
          objc_msgSend(v16, "superview");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "frame");
          objc_msgSend(v17, "convertPoint:toView:", v5);
          v19 = v18;

          v20 = Height - v19 - v8;
          if (v20 > 0.0)
          {
            *(_OWORD *)&v29.a = v23;
            *(_OWORD *)&v29.c = v22;
            *(_OWORD *)&v29.tx = v21;
            CGAffineTransformTranslate(&v24, &v29, 0.0, v20 * a3);
            objc_msgSend(v16, "setTransform:", &v24);
          }
        }

        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v25, v31, 16);
    }
    while (v11);
  }
  v29 = v30;
  objc_msgSend(v4, "setTransform:", &v29, v21, v22, v23);

}

- (BOOL)animationShouldBeginForScrollView:(id)a3 currentlyFullyCompressed:(BOOL)a4
{
  return 1;
}

- (double)maximumBarHeightForTraitCollection:(id)a3
{
  void *v3;
  double Height;
  CGRect v6;

  -[TUToolbarDefaultCompressionAnimation toolbar](self, "toolbar", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "frame");
  Height = CGRectGetHeight(v6);

  return Height;
}

- (double)minimumBarHeightForTraitCollection:(id)a3
{
  return 0.0;
}

- (BOOL)shouldCompressAtTop
{
  return 0;
}

- (BOOL)shouldCloseGapOnScroll
{
  return 1;
}

- (void)reloadWithTraitCollection:(id)a3
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  double v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _OWORD v21[8];
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  -[TUToolbarDefaultCompressionAnimation toolbar](self, "toolbar", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ts_barButtonViews");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v23;
    v19 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 80);
    v20 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 64);
    v17 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 112);
    v18 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 96);
    v15 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 16);
    v16 = *MEMORY[0x1E0CD2610];
    v13 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 48);
    v14 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 32);
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v23 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        objc_msgSend(v9, "layer", v13, v14, v15, v16, v17, v18, v19, v20);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v11) = 1.0;
        objc_msgSend(v10, "setOpacity:", v11);

        objc_msgSend(v9, "layer");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v21[4] = v20;
        v21[5] = v19;
        v21[6] = v18;
        v21[7] = v17;
        v21[0] = v16;
        v21[1] = v15;
        v21[2] = v14;
        v21[3] = v13;
        objc_msgSend(v12, "setTransform:", v21);

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v6);
  }

}

- (double)topOffset
{
  return self->_topOffset;
}

- (UIToolbar)toolbar
{
  return self->_toolbar;
}

- (void)setToolbar:(id)a3
{
  objc_storeStrong((id *)&self->_toolbar, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_toolbar, 0);
}

@end
