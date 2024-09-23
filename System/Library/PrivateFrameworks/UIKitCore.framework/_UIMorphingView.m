@implementation _UIMorphingView

- (void)addContentView:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  unint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  _QWORD v34[5];
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  void *v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[_UIMorphingView contentViews](self, "contentViews");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    v6 = (void *)objc_opt_new();
    -[_UIMorphingView setContentViews:](self, "setContentViews:", v6);

  }
  -[_UIMorphingView contentViews](self, "contentViews");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "indexOfObject:", v4);

  -[_UIMorphingView contentViews](self, "contentViews");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v8 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v11 = objc_msgSend(v9, "count");

    if (v11)
    {
      objc_msgSend(v4, "setAlpha:", 0.0);
    }
    else
    {
      objc_msgSend(v4, "bounds");
      -[UIView setBounds:](self, "setBounds:");
    }
    -[_UIMorphingView contentViews](self, "contentViews");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addObject:", v4);

    -[UIView addSubview:](self, "addSubview:", v4);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIMorphingView contentViews](self, "contentViews");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "moveObjectsAtIndexes:toIndex:", v12, objc_msgSend(v13, "count") - 1);

  }
  -[UIView bounds](self, "bounds");
  -[_UIMorphingView setInitialBounds:](self, "setInitialBounds:");
  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  -[_UIMorphingView contentViews](self, "contentViews");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v36;
    do
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v36 != v18)
          objc_enumerationMutation(v15);
        v20 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
        objc_msgSend(v20, "alpha");
        objc_msgSend(v20, "_uimorphingView_setInitialAlpha:");
      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
    }
    while (v17);
  }

  if (-[_UIMorphingView useOpacityPairFilter](self, "useOpacityPairFilter"))
  {
    -[_UIMorphingView contentViews](self, "contentViews");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "count");

    if (v22 >= 2)
    {
      -[_UIMorphingView opacityPairSourceView](self, "opacityPairSourceView");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "layer");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "setFilters:", 0);

      -[_UIMorphingView opacityPairSourceView](self, "opacityPairSourceView");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "layer");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "removeAllAnimations");

      -[_UIMorphingView contentViews](self, "contentViews");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIMorphingView contentViews](self, "contentViews");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "objectAtIndexedSubscript:", objc_msgSend(v28, "count") - 2);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIMorphingView setOpacityPairSourceView:](self, "setOpacityPairSourceView:", v29);

      objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", *MEMORY[0x1E0CD2E78]);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = v30;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v39, 1);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIMorphingView opacityPairSourceView](self, "opacityPairSourceView");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "layer");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "setFilters:", v31);

    }
  }
  v34[0] = MEMORY[0x1E0C809B0];
  v34[1] = 3221225472;
  v34[2] = __34___UIMorphingView_addContentView___block_invoke;
  v34[3] = &unk_1E16B1B28;
  v34[4] = self;
  +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v34);

}

- (void)setProgress:(double)a3
{
  if (self->_progress != a3)
  {
    self->_progress = a3;
    -[_UIMorphingView _updateMorphProgress](self, "_updateMorphProgress");
  }
}

- (id)_currentDestinationView
{
  void *v2;
  void *v3;

  -[_UIMorphingView contentViews](self, "contentViews");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lastObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)_updateMorphProgress
{
  void *v3;
  void *v4;
  unint64_t v5;
  double v6;
  double v7;
  CGFloat v8;
  double v9;
  double v10;
  CGFloat v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  double MinX;
  double Width;
  double Height;
  double v26;
  double v27;
  double v28;
  double v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t i;
  void *v35;
  double v36;
  CGFloat v37;
  double v38;
  CGFloat v39;
  double v40;
  CGFloat v41;
  double v42;
  CGFloat v43;
  double v44;
  CGFloat v45;
  void *v46;
  double v47;
  double v48;
  double v49;
  double v50;
  void *v51;
  void *v52;
  void *v53;
  CGFloat v54;
  CGFloat v55;
  CGFloat v56;
  CGFloat v57;
  CGFloat v58;
  double v59;
  double v60;
  double v61;
  double MinY;
  double v63;
  double v64;
  double v65;
  double v66;
  CGFloat recta;
  double rect;
  double v69;
  double v70;
  CGAffineTransform v71;
  CGAffineTransform v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  _BYTE v77[128];
  uint64_t v78;
  CGRect v79;
  CGRect v80;
  CGRect v81;
  CGRect v82;
  CGRect v83;
  CGRect v84;
  CGRect v85;
  CGRect v86;
  CGRect v87;
  CGRect v88;
  CGRect v89;
  CGRect v90;

  v78 = *MEMORY[0x1E0C80C00];
  -[_UIMorphingView _currentDestinationView](self, "_currentDestinationView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIMorphingView contentViews](self, "contentViews");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5 < 2)
  {
    objc_msgSend(v3, "setAlpha:", 1.0);
  }
  else
  {
    -[_UIMorphingView progress](self, "progress");
    v69 = v6;
    -[_UIMorphingView initialBounds](self, "initialBounds");
    v8 = v7;
    v57 = v9;
    v58 = v7;
    v11 = v10;
    recta = v10;
    v12 = v9;
    v14 = v13;
    v55 = v13;
    objc_msgSend(v3, "bounds");
    v16 = v15;
    v70 = v15;
    v18 = v17;
    v20 = v19;
    v22 = v21;
    v56 = v21;
    v79.origin.x = v8;
    v79.origin.y = v11;
    v79.size.width = v12;
    v79.size.height = v14;
    MinX = CGRectGetMinX(v79);
    v80.origin.x = v16;
    v80.origin.y = v18;
    v54 = v20;
    v80.size.width = v20;
    v80.size.height = v22;
    v65 = (1.0 - v69) * MinX + v69 * CGRectGetMinX(v80);
    v81.origin.x = v58;
    v81.origin.y = recta;
    v81.size.width = v57;
    v81.size.height = v55;
    MinY = CGRectGetMinY(v81);
    v82.origin.x = v70;
    v82.origin.y = v18;
    v82.size.width = v20;
    v82.size.height = v56;
    v63 = (1.0 - v69) * MinY + v69 * CGRectGetMinY(v82);
    v83.origin.x = v58;
    v83.origin.y = recta;
    v83.size.width = v57;
    v83.size.height = v55;
    Width = CGRectGetWidth(v83);
    v84.origin.x = v70;
    v84.origin.y = v18;
    v84.size.width = v20;
    v84.size.height = v56;
    v60 = (1.0 - v69) * Width + v69 * CGRectGetWidth(v84);
    v85.origin.x = v58;
    v85.origin.y = recta;
    v85.size.width = v57;
    v85.size.height = v55;
    Height = CGRectGetHeight(v85);
    v86.origin.x = v70;
    v86.origin.y = v18;
    v86.size.width = v20;
    v86.size.height = v56;
    v59 = 1.0 - v69;
    -[UIView setBounds:](self, "setBounds:", v65, v63, v60, (1.0 - v69) * Height + v69 * CGRectGetHeight(v86));
    -[UIView bounds](self, "bounds");
    v66 = v27;
    rect = v26;
    v61 = v29;
    v64 = v28;
    v73 = 0u;
    v74 = 0u;
    v75 = 0u;
    v76 = 0u;
    -[_UIMorphingView contentViews](self, "contentViews");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v73, v77, 16);
    if (v31)
    {
      v32 = v31;
      v33 = *(_QWORD *)v74;
      do
      {
        for (i = 0; i != v32; ++i)
        {
          if (*(_QWORD *)v74 != v33)
            objc_enumerationMutation(v30);
          v35 = *(void **)(*((_QWORD *)&v73 + 1) + 8 * i);
          objc_msgSend(v35, "bounds", *(_QWORD *)&v54);
          v37 = v36;
          v39 = v38;
          v41 = v40;
          v43 = v42;
          v87.origin.x = rect;
          v87.origin.y = v66;
          v87.size.width = v64;
          v87.size.height = v61;
          v70 = CGRectGetWidth(v87);
          v88.origin.x = v37;
          v88.origin.y = v39;
          v88.size.width = v41;
          v88.size.height = v43;
          v70 = v70 / CGRectGetWidth(v88);
          v89.origin.x = rect;
          v89.origin.y = v66;
          v89.size.width = v64;
          v89.size.height = v61;
          v44 = CGRectGetHeight(v89);
          v90.origin.x = v37;
          v90.origin.y = v39;
          v90.size.width = v41;
          v90.size.height = v43;
          v45 = CGRectGetHeight(v90);
          CGAffineTransformMakeScale(&v72, v70, v44 / v45);
          v71 = v72;
          objc_msgSend(v35, "setTransform:", &v71);
          objc_msgSend(v35, "setCenter:", rect + v64 * 0.5, v66 + v61 * 0.5);
          -[_UIMorphingView opacityPairSourceView](self, "opacityPairSourceView");
          v46 = (void *)objc_claimAutoreleasedReturnValue();

          if (v35 == v46)
          {
            objc_msgSend(v3, "_uimorphingView_getInitialAlpha");
            v50 = v69 + v59 * v49;
            -[_UIMorphingView opacityPairSourceView](self, "opacityPairSourceView");
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v51, "layer");
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v50);
            v53 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v52, "setValue:forKey:", v53, CFSTR("filters.opacityPair.inputAmount"));

          }
          else
          {
            if (v35 == v3)
              v47 = 1.0;
            else
              v47 = 0.0;
            objc_msgSend(v35, "_uimorphingView_getInitialAlpha");
            objc_msgSend(v35, "setAlpha:", v69 * v47 + v59 * v48);
          }
        }
        v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v73, v77, 16);
      }
      while (v32);
    }

  }
}

- (double)progress
{
  return self->_progress;
}

- (BOOL)useOpacityPairFilter
{
  return self->_useOpacityPairFilter;
}

- (void)setUseOpacityPairFilter:(BOOL)a3
{
  self->_useOpacityPairFilter = a3;
}

- (NSMutableOrderedSet)contentViews
{
  return self->_contentViews;
}

- (void)setContentViews:(id)a3
{
  objc_storeStrong((id *)&self->_contentViews, a3);
}

- (CGRect)initialBounds
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_initialBounds.origin.x;
  y = self->_initialBounds.origin.y;
  width = self->_initialBounds.size.width;
  height = self->_initialBounds.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setInitialBounds:(CGRect)a3
{
  self->_initialBounds = a3;
}

- (UIView)opacityPairSourceView
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_opacityPairSourceView);
}

- (void)setOpacityPairSourceView:(id)a3
{
  objc_storeWeak((id *)&self->_opacityPairSourceView, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_opacityPairSourceView);
  objc_storeStrong((id *)&self->_contentViews, 0);
}

@end
