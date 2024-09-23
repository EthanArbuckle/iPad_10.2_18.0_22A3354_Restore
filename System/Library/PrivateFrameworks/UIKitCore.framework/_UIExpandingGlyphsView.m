@implementation _UIExpandingGlyphsView

- (BOOL)prefersBaselineAlignment
{
  return 1;
}

- (_UIExpandingGlyphsView)initWithFrame:(CGRect)a3
{
  _UIExpandingGlyphsView *result;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_UIExpandingGlyphsView;
  result = -[UIView initWithFrame:](&v4, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (result)
    result->_fadesOut = 1;
  return result;
}

- (void)setAttributedString:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  CGRect v32;
  _OWORD v33[2];
  _BYTE v34[128];
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_storeStrong((id *)&self->_attributedString, a3);
  -[UIView window](self, "window");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[UIView window](self, "window");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "screen");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "scale");
    v10 = v9;

  }
  else
  {
    +[UIScreen mainScreen](UIScreen, "mainScreen");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "scale");
    v10 = v11;
  }

  memset(v33, 0, sizeof(v33));
  memset(&v32, 0, sizeof(v32));

  objc_msgSend(v5, "_ui_glyphImageViewsScale:outImageRect:outLineRect:outBaselineOffset:", v33, &v32, &self->_baselineOffset, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIExpandingGlyphsView setImageViews:](self, "setImageViews:", v12);

  self->_intrinsicSize.width = CGRectGetWidth(v32);
  self->_intrinsicSize.height = CGRectGetHeight(v32);
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  -[UIView subviews](self, "subviews");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v28, v35, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v29 != v16)
          objc_enumerationMutation(v13);
        objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * i), "removeFromSuperview");
      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v28, v35, 16);
    }
    while (v15);
  }

  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  -[_UIExpandingGlyphsView imageViews](self, "imageViews", 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v24, v34, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v25;
    do
    {
      for (j = 0; j != v20; ++j)
      {
        if (*(_QWORD *)v25 != v21)
          objc_enumerationMutation(v18);
        v23 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * j);
        -[UIView addSubview:](self, "addSubview:", v23);
        objc_msgSend(v23, "setAlpha:", 0.0);
      }
      v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v24, v34, 16);
    }
    while (v20);
  }

  -[UIView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
}

- (void)animateCompletionBlock:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  unint64_t v11;
  _BOOL4 expandsFromLeftToRight;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  unint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  unint64_t v27;
  id v28;
  id v29;
  double v30;
  void *v31;
  id obj;
  uint64_t v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  _UIExpandingGlyphsView *v47;
  _OWORD v48[8];
  CATransform3D v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  _BYTE v54[128];
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  -[_UIExpandingGlyphsView setCompletionBlock:](self, "setCompletionBlock:", a3);
  v4 = objc_alloc(MEMORY[0x1E0CD27D0]);
  LODWORD(v5) = 1046809695;
  LODWORD(v6) = 990250344;
  LODWORD(v7) = 1057860847;
  LODWORD(v8) = 1064564184;
  v9 = (void *)objc_msgSend(v4, "initWithControlPoints::::", v5, v6, v7, v8);
  -[UIView subviews](self, "subviews");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "count");

  v52 = 0u;
  v53 = 0u;
  v50 = 0u;
  v51 = 0u;
  expandsFromLeftToRight = self->_expandsFromLeftToRight;
  v47 = self;
  -[UIView subviews](self, "subviews");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (expandsFromLeftToRight)
    objc_msgSend(v13, "objectEnumerator");
  else
    objc_msgSend(v13, "reverseObjectEnumerator");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = v15;
  v43 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v50, v54, 16);
  if (v43)
  {
    v42 = *(_QWORD *)v51;
    v46 = *MEMORY[0x1E0CD2B58];
    v33 = *MEMORY[0x1E0CD2B60];
    v17 = 0.0;
    v18 = 0x1E0CD2000uLL;
    v40 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 80);
    v41 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 64);
    v38 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 112);
    v39 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 96);
    v36 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 16);
    v37 = *MEMORY[0x1E0CD2610];
    v34 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 48);
    v35 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 32);
    obj = v15;
    do
    {
      v19 = 0;
      do
      {
        if (*(_QWORD *)v51 != v42)
          objc_enumerationMutation(obj);
        v44 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * v19);
        v45 = v19;
        objc_msgSend(v44, "layer", obj);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "removeAllAnimations");

        objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 3);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_alloc_init(*(Class *)(v18 + 2120));
        objc_msgSend(v22, "setMass:", 2.0);
        objc_msgSend(v22, "setStiffness:", 300.0);
        objc_msgSend(v22, "setDamping:", 400.0);
        objc_msgSend(v22, "setTimingFunction:", v9);
        objc_msgSend(v22, "setDuration:", 0.91);
        objc_msgSend(v22, "setKeyPath:", CFSTR("transform"));
        v23 = (void *)MEMORY[0x1E0CB3B18];
        CATransform3DMakeScale(&v49, 0.5, 0.5, 1.0);
        objc_msgSend(v23, "valueWithCATransform3D:", &v49);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "setFromValue:", v24);

        v48[4] = v41;
        v48[5] = v40;
        v48[6] = v39;
        v48[7] = v38;
        v48[0] = v37;
        v48[1] = v36;
        v48[2] = v35;
        v48[3] = v34;
        objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCATransform3D:", v48);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "setToValue:", v25);

        objc_msgSend(v22, "setBeginTime:", v17);
        objc_msgSend(v22, "setFillMode:", v46);
        objc_msgSend(v22, "setRemovedOnCompletion:", v47->_fadesOut);
        objc_msgSend(v21, "addObject:", v22);
        v26 = objc_alloc_init(*(Class *)(v18 + 2120));
        objc_msgSend(v26, "setMass:", 2.0);
        objc_msgSend(v26, "setStiffness:", 300.0);
        objc_msgSend(v26, "setDamping:", 400.0);
        objc_msgSend(v26, "setTimingFunction:", v9);
        objc_msgSend(v26, "setDuration:", 0.91);
        objc_msgSend(v26, "setKeyPath:", CFSTR("opacity"));
        objc_msgSend(v26, "setFromValue:", &unk_1E1A96380);
        objc_msgSend(v26, "setToValue:", &unk_1E1A96390);
        objc_msgSend(v26, "setBeginTime:", v17);
        objc_msgSend(v26, "setFillMode:", v46);
        objc_msgSend(v26, "setRemovedOnCompletion:", v47->_fadesOut);
        objc_msgSend(v21, "addObject:", v26);
        v27 = v18;
        if (v47->_fadesOut)
        {
          v28 = objc_alloc_init(*(Class *)(v18 + 2120));
          objc_msgSend(v28, "setMass:", 2.0);
          objc_msgSend(v28, "setStiffness:", 300.0);
          objc_msgSend(v28, "setDamping:", 400.0);
          objc_msgSend(v28, "setTimingFunction:", v9);
          objc_msgSend(v28, "setDuration:", 0.91);
          objc_msgSend(v28, "setKeyPath:", CFSTR("opacity"));
          objc_msgSend(v28, "setFromValue:", &unk_1E1A96390);
          objc_msgSend(v28, "setToValue:", &unk_1E1A96380);
          objc_msgSend(v28, "setBeginTime:", 1.49);
          objc_msgSend(v28, "setFillMode:", v33);
          objc_msgSend(v21, "addObject:", v28);

        }
        v29 = objc_alloc_init(MEMORY[0x1E0CD2700]);
        objc_msgSend(v29, "setAnimations:", v21);
        objc_msgSend(v29, "setDuration:", 2.4);
        LODWORD(v30) = 1066192077;
        objc_msgSend(v29, "setSpeed:", v30);
        objc_msgSend(v29, "setRemovedOnCompletion:", v47->_fadesOut);
        objc_msgSend(v29, "setFillMode:", v46);
        +[_UIViewWeakCAAnimationDelegate weakAnimationDelegate:](_UIViewWeakCAAnimationDelegate, "weakAnimationDelegate:", v47);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "setDelegate:", v31);

        objc_msgSend(v44, "addAnimation:forKey:", v29, CFSTR("animations"));
        -[_UIExpandingGlyphsView setRemainingAnimationCount:](v47, "setRemainingAnimationCount:", -[_UIExpandingGlyphsView remainingAnimationCount](v47, "remainingAnimationCount") + 1);
        v17 = 0.14 / (double)v11 + v17;

        ++v19;
        v18 = v27;
      }
      while (v43 != v45 + 1);
      v16 = obj;
      v43 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v50, v54, 16);
    }
    while (v43);
  }

}

- (CGSize)intrinsicContentSize
{
  double width;
  double height;
  CGSize result;

  width = self->_intrinsicSize.width;
  height = self->_intrinsicSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width;
  double height;
  CGSize result;

  width = self->_intrinsicSize.width;
  height = self->_intrinsicSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)animationDidStop:(id)a3 finished:(BOOL)a4
{
  void *v5;
  id v6;

  -[_UIExpandingGlyphsView setRemainingAnimationCount:](self, "setRemainingAnimationCount:", -[_UIExpandingGlyphsView remainingAnimationCount](self, "remainingAnimationCount", a3, a4) - 1);
  if (!-[_UIExpandingGlyphsView remainingAnimationCount](self, "remainingAnimationCount"))
  {
    -[_UIExpandingGlyphsView completionBlock](self, "completionBlock");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    -[_UIExpandingGlyphsView setCompletionBlock:](self, "setCompletionBlock:", 0);
    v5 = v6;
    if (v6)
    {
      (*((void (**)(id))v6 + 2))(v6);
      v5 = v6;
    }

  }
}

- (NSAttributedString)attributedString
{
  return self->_attributedString;
}

- (double)baselineOffset
{
  return self->_baselineOffset;
}

- (BOOL)expandsFromLeftToRight
{
  return self->_expandsFromLeftToRight;
}

- (void)setExpandsFromLeftToRight:(BOOL)a3
{
  self->_expandsFromLeftToRight = a3;
}

- (BOOL)fadesOut
{
  return self->_fadesOut;
}

- (void)setFadesOut:(BOOL)a3
{
  self->_fadesOut = a3;
}

- (NSArray)imageViews
{
  return self->_imageViews;
}

- (void)setImageViews:(id)a3
{
  objc_storeStrong((id *)&self->_imageViews, a3);
}

- (id)completionBlock
{
  return self->_completionBlock;
}

- (void)setCompletionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 448);
}

- (int)remainingAnimationCount
{
  return self->_remainingAnimationCount;
}

- (void)setRemainingAnimationCount:(int)a3
{
  self->_remainingAnimationCount = a3;
}

- (CGSize)intrinsicSize
{
  double width;
  double height;
  CGSize result;

  width = self->_intrinsicSize.width;
  height = self->_intrinsicSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setIntrinsicSize:(CGSize)a3
{
  self->_intrinsicSize = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionBlock, 0);
  objc_storeStrong((id *)&self->_imageViews, 0);
  objc_storeStrong((id *)&self->_attributedString, 0);
}

@end
