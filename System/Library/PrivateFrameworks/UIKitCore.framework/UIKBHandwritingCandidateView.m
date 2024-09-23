@implementation UIKBHandwritingCandidateView

- (UIKBHandwritingCandidateView)initWithFrame:(CGRect)a3 keyplane:(id)a4 key:(id)a5
{
  UIKBHandwritingCandidateView *v5;
  UIKBHandwritingCandidateView *v6;
  _QWORD v8[4];
  UIKBHandwritingCandidateView *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)UIKBHandwritingCandidateView;
  v5 = -[UIKBCandidateView initWithFrame:keyplane:key:](&v10, sel_initWithFrame_keyplane_key_, a4, a5, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v6 = v5;
  if (v5)
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __59__UIKBHandwritingCandidateView_initWithFrame_keyplane_key___block_invoke;
    v8[3] = &unk_1E16B1B28;
    v9 = v5;
    +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v8);

  }
  return v6;
}

uint64_t __59__UIKBHandwritingCandidateView_initWithFrame_keyplane_key___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateCandidateKey");
}

+ (double)shadowYForBounds:(CGRect)a3 shadowHeight:(double)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  double MinY;
  CGRect v11;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  MinY = CGRectGetMinY(a3);
  v11.origin.x = x;
  v11.origin.y = y;
  v11.size.width = width;
  v11.size.height = height;
  return MinY + (CGRectGetHeight(v11) - a4) * 0.5;
}

- (void)updateForKeyplane:(id)a3 key:(id)a4
{
  -[UIKBCandidateView clearCandidateKey](self, "clearCandidateKey", a3, a4);
  -[UIKBHandwritingCandidateView updateCandidateKey](self, "updateCandidateKey");
}

- (void)updateCandidateKey
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  __objc2_class **v17;
  void *v18;
  void *v19;
  void *v20;
  UIKBHandwritingCandidateView *v21;
  void *v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  void *v33;
  void *v34;
  id v35;
  CGRect v36;
  CGRect v37;
  CGRect v38;
  CGRect v39;
  CGRect v40;
  CGRect v41;
  CGRect v42;
  CGRect v43;

  -[UIKBKeyView factory](self, "factory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKBKeyView key](self, "key");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKBKeyView keyplane](self, "keyplane");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "traitsForKey:onKeyplane:", v4, v5);
  v35 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v35, "geometry");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "frame");
  objc_msgSend(v35, "geometry", CGRectGetMinY(v36));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "paddedFrame");
  CGRectGetMinY(v37);

  objc_msgSend(v35, "geometry");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "frame");
  objc_msgSend(v35, "geometry", CGRectGetMaxX(v38));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "paddedFrame");
  CGRectGetMaxX(v39);

  objc_msgSend(v35, "geometry");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "frame");
  objc_msgSend(v35, "geometry", CGRectGetMaxY(v40));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "paddedFrame");
  CGRectGetMaxY(v41);

  objc_msgSend(v35, "geometry");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "frame");
  objc_msgSend(v35, "geometry", CGRectGetMinX(v42));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "paddedFrame");
  CGRectGetMinX(v43);

  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "candidateController");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  -[UIKBCandidateView candidateKey](self, "candidateKey");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v16)
  {
    if ((-[UIKBCandidateView visualStyling](self, "visualStyling") & 0x3F) == 1
      || (-[UIKBCandidateView visualStyling](self, "visualStyling") & 0x3F) == 0x18
      || (-[UIKBCandidateView visualStyling](self, "visualStyling") & 0x3F) == 0x19)
    {
      v17 = off_1E167AD98;
    }
    else
    {
      v17 = off_1E167AD98;
      if ((-[UIKBCandidateView visualStyling](self, "visualStyling") & 0x3F) != 0x1A
        && (-[UIKBCandidateView visualStyling](self, "visualStyling") & 0x3F) != 0x17)
      {
        v17 = off_1E167AD90;
      }
    }
    -[__objc2_class configuration](*v17, "configuration");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView bounds](self, "bounds");
    v19 = (void *)objc_msgSend(v15, "newCandidateKeyWithFrame:configuration:", v18);
    -[UIKBCandidateView setCandidateKey:](self, "setCandidateKey:", v19);

  }
  -[UIKBCandidateView candidateKey](self, "candidateKey");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "superview");
  v21 = (UIKBHandwritingCandidateView *)objc_claimAutoreleasedReturnValue();

  if (v21 != self)
  {
    -[UIKBCandidateView candidateKey](self, "candidateKey");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "removeFromSuperview");

    -[UIKBCandidateView candidateKey](self, "candidateKey");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setHidden:", 0);

    -[UIKBCandidateView candidateKey](self, "candidateKey");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView addSubview:](self, "addSubview:", v24);

  }
  -[UIView bounds](self, "bounds");
  v26 = v25;
  v28 = v27;
  v30 = v29;
  v32 = v31;
  -[UIKBCandidateView candidateKey](self, "candidateKey");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "setFrame:", v26, v28, v30, v32);

  -[UIKBCandidateView candidateKey](self, "candidateKey");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "setAutoresizingMask:", 18);

  objc_msgSend(v15, "setActiveCandidateViewType:", 1);
}

@end
