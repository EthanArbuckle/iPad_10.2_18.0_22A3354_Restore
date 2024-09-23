@implementation UIKBCandidateView

- (UIKBCandidateView)initWithFrame:(CGRect)a3 keyplane:(id)a4 key:(id)a5
{
  double height;
  double width;
  double y;
  double x;
  id v11;
  UIKBCandidateView *v12;
  UIKBCandidateView *v13;
  _QWORD v15[4];
  UIKBCandidateView *v16;
  objc_super v17;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v11 = a4;
  v17.receiver = self;
  v17.super_class = (Class)UIKBCandidateView;
  v12 = -[UIKBKeyView initWithFrame:keyplane:key:](&v17, sel_initWithFrame_keyplane_key_, v11, a5, x, y, width, height);
  v13 = v12;
  if (v12)
  {
    -[UIView setEnabled:](v12, "setEnabled:", 1);
    -[UIView setOpaque:](v13, "setOpaque:", 0);
    -[UIKBCandidateView setVisualStyling:](v13, "setVisualStyling:", objc_msgSend(v11, "visualStyling"));
    if (-[UIKBCandidateView isTenKey](v13, "isTenKey"))
    {
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __48__UIKBCandidateView_initWithFrame_keyplane_key___block_invoke;
      v15[3] = &unk_1E16B1B28;
      v16 = v13;
      +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v15);

    }
  }

  return v13;
}

uint64_t __48__UIKBCandidateView_initWithFrame_keyplane_key___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateCandidateKey");
}

- (void)dealloc
{
  objc_super v3;

  -[UIKBCandidateView clearCandidateKey](self, "clearCandidateKey");
  v3.receiver = self;
  v3.super_class = (Class)UIKBCandidateView;
  -[UIKBKeyView dealloc](&v3, sel_dealloc);
}

- (void)updateForKeyplane:(id)a3 key:(id)a4
{
  -[UIKBCandidateView clearCandidateKey](self, "clearCandidateKey", a3, a4);
  -[UIKBCandidateView updateCandidateKey](self, "updateCandidateKey");
}

- (void)displayLayer:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  objc_super v11;

  v4 = a3;
  if (-[UIKBCandidateView isTenKey](self, "isTenKey"))
  {
    -[UIKBKeyView screenTraits](self, "screenTraits");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "idiom") == 1)
    {
LABEL_9:

      goto LABEL_10;
    }
    -[UIKBKeyView screenTraits](self, "screenTraits");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "idiom") == 24)
    {
LABEL_8:

      goto LABEL_9;
    }
    -[UIKBKeyView screenTraits](self, "screenTraits");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "idiom") == 25)
    {
LABEL_7:

      goto LABEL_8;
    }
    -[UIKBKeyView screenTraits](self, "screenTraits");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "idiom") == 26)
    {

      goto LABEL_7;
    }
    -[UIKBKeyView screenTraits](self, "screenTraits");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "idiom");

    if (v10 != 23)
    {
      v11.receiver = self;
      v11.super_class = (Class)UIKBCandidateView;
      -[UIKBKeyView displayLayer:](&v11, sel_displayLayer_, v4);
    }
  }
LABEL_10:

}

- (id)candidateList
{
  void *v2;
  void *v3;

  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "candidateController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)isTenKey
{
  void *v2;
  unsigned int v3;

  -[UIKBKeyView key](self, "key");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "rendering");

  return (v3 < 0x23) & (0x600000002uLL >> v3);
}

- (void)updateCandidateKey
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  char v10;
  void *v11;
  double MinY;
  void *v13;
  double v14;
  void *v15;
  double MaxX;
  void *v17;
  double v18;
  void *v19;
  double MaxY;
  void *v21;
  double v22;
  void *v23;
  double MinX;
  void *v25;
  double v26;
  void *v27;
  void *v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  void *v37;
  void *v38;
  __objc2_class **v39;
  double v40;
  void *v41;
  void *v42;
  void *v43;
  UIKBCandidateView *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  id v55;
  CGRect v56;
  CGRect v57;
  CGRect v58;
  CGRect v59;
  CGRect v60;
  CGRect v61;
  CGRect v62;
  CGRect v63;

  -[UIKBKeyView factory](self, "factory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKBKeyView key](self, "key");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKBKeyView keyplane](self, "keyplane");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "traitsForKey:onKeyplane:", v4, v5);
  v55 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v55, "geometry");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "roundRectRadius");
  v8 = v7;

  objc_msgSend(v55, "geometry");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "roundRectCorners");

  objc_msgSend(v55, "geometry");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "frame");
  MinY = CGRectGetMinY(v56);
  objc_msgSend(v55, "geometry");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "paddedFrame");
  v14 = MinY - CGRectGetMinY(v57);

  objc_msgSend(v55, "geometry");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "frame");
  MaxX = CGRectGetMaxX(v58);
  objc_msgSend(v55, "geometry");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "paddedFrame");
  v18 = MaxX - CGRectGetMaxX(v59);

  objc_msgSend(v55, "geometry");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "frame");
  MaxY = CGRectGetMaxY(v60);
  objc_msgSend(v55, "geometry");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "paddedFrame");
  v22 = MaxY - CGRectGetMaxY(v61);

  objc_msgSend(v55, "geometry");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "frame");
  MinX = CGRectGetMinX(v62);
  objc_msgSend(v55, "geometry");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "paddedFrame");
  v26 = MinX - CGRectGetMinX(v63);

  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "candidateController");
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  -[UIView bounds](self, "bounds");
  v30 = v29 - v26;
  v32 = v31 - (v18 - v26);
  v34 = v33 - v14;
  v36 = v35 - (v22 - v14);
  -[UIKBCandidateView candidateKey](self, "candidateKey");
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v37)
  {
    if ((-[UIKBCandidateView visualStyling](self, "visualStyling") & 0x3F) == 1
      && (-[UIKBCandidateView visualStyling](self, "visualStyling") & 0x80) != 0)
    {
      +[UIKeyboardCandidateViewConfiguration configuration](UIKeyboardCandidateViewConfigurationTenKeyPadSplit, "configuration");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v38 = 0;
    }
    if ((-[UIKBCandidateView visualStyling](self, "visualStyling") & 0x3F) == 3)
    {
      -[UIView frame](self, "frame");
      v39 = off_1E167AD88;
      if (v40 > 84.0)
        v39 = off_1E167AE40;
    }
    else
    {
      v39 = off_1E167AE38;
    }
    -[__objc2_class configuration](*v39, "configuration");
    v41 = (void *)objc_claimAutoreleasedReturnValue();

    v42 = (void *)objc_msgSend(v28, "newCandidateKeyWithFrame:configuration:", v41, v30, v34, v32, v36);
    -[UIKBCandidateView setCandidateKey:](self, "setCandidateKey:", v42);

  }
  -[UIKBCandidateView candidateKey](self, "candidateKey");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "superview");
  v44 = (UIKBCandidateView *)objc_claimAutoreleasedReturnValue();

  if (v44 != self)
  {
    -[UIKBCandidateView candidateKey](self, "candidateKey");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "removeFromSuperview");

    -[UIKBCandidateView candidateKey](self, "candidateKey");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "setHidden:", 0);

    -[UIKBCandidateView candidateKey](self, "candidateKey");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView addSubview:](self, "addSubview:", v47);

  }
  -[UIKBCandidateView candidateKey](self, "candidateKey");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "setFrame:", v30, v34, v32, v36);

  -[UIKBCandidateView candidateKey](self, "candidateKey");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "setAutoresizingMask:", 18);

  -[UIKBCandidateView candidateKey](self, "candidateKey");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "_setContinuousCornerRadius:", v8);

  -[UIKBCandidateView candidateKey](self, "candidateKey");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "layer");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "setMaskedCorners:", v10 & 0xF);

  -[UIKBCandidateView candidateKey](self, "candidateKey");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "layer");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "setMasksToBounds:", 1);

  objc_msgSend(v28, "setActiveCandidateViewType:", 1);
  objc_msgSend(v28, "updateStates");

}

- (void)clearCandidateKey
{
  void *v3;
  void *v4;
  UIKBCandidateView *v5;
  void *v6;
  id v7;

  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "candidateController");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "candidateKey");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "superview");
  v5 = (UIKBCandidateView *)objc_claimAutoreleasedReturnValue();

  if (v5 == self)
  {
    objc_msgSend(v7, "candidateKey");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeFromSuperview");

  }
}

- ($5C396DA91E87D63640AC871340DC94CC)visualStyling
{
  return ($5C396DA91E87D63640AC871340DC94CC)*(_QWORD *)&self->_visualStyling;
}

- (void)setVisualStyling:(id)a3
{
  *(_QWORD *)&self->_visualStyling = *(_QWORD *)&a3;
}

- (UIView)candidateKey
{
  return self->_candidateKey;
}

- (void)setCandidateKey:(id)a3
{
  objc_storeStrong((id *)&self->_candidateKey, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_candidateKey, 0);
}

@end
