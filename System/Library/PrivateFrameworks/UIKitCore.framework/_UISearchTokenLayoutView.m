@implementation _UISearchTokenLayoutView

- (_UISearchTokenLayoutView)initWithDelegateView:(id)a3
{
  id v5;
  _UISearchTokenLayoutView *v6;
  _UISearchTokenLayoutView *v7;
  id *p_delegateView;
  _UISearchTokenLayoutView *v9;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_UISearchTokenLayoutView;
  v6 = -[UIView initWithFrame:](&v11, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v7 = v6;
  if (v6)
  {
    p_delegateView = (id *)&v6->_delegateView;
    objc_storeStrong((id *)&v6->_delegateView, a3);
    objc_msgSend(*p_delegateView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIView setAutoresizesSubviews:](v7, "setAutoresizesSubviews:", 0);
    -[UIView addSubview:](v7, "addSubview:", *p_delegateView);
    v9 = v7;
  }

  return v7;
}

- (_UISearchTokenLayoutView)init
{
  id v2;

  objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("Unimplemented"), 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (_UISearchTokenLayoutView)initWithFrame:(CGRect)a3
{
  id v3;

  objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("Unimplemented"), 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v3);
}

- (_UISearchTokenLayoutView)initWithCoder:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("Unimplemented"), 0);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v4);
}

- (BOOL)respondsToSelector:(SEL)a3
{
  char v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_UISearchTokenLayoutView;
  if (-[_UISearchTokenLayoutView respondsToSelector:](&v5, sel_respondsToSelector_))
    v3 = 1;
  else
    v3 = objc_opt_respondsToSelector();
  return v3 & 1;
}

- (id)methodSignatureForSelector:(SEL)a3
{
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_UISearchTokenLayoutView;
  -[_UISearchTokenLayoutView methodSignatureForSelector:](&v7, sel_methodSignatureForSelector_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    -[_UIAtomTextViewAtomLayout methodSignatureForSelector:](self->_delegateView, "methodSignatureForSelector:", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (id)forwardingTargetForSelector:(SEL)a3
{
  return self->_delegateView;
}

- (UIEdgeInsets)atomInsets
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  UIUserInterfaceLayoutDirection v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  UIEdgeInsets result;

  UIRoundToViewScale(self);
  v4 = v3;
  UIRoundToViewScale(self);
  v6 = 3.0 - v5;
  if (-[_UISearchTokenLayoutView isLastSearchToken](self, "isLastSearchToken"))
  {
    UIRoundToViewScale(self);
    v8 = v7;
    v9 = -[UIView effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection");
    v10 = -0.0;
    if (v9)
      v11 = -0.0;
    else
      v11 = v8;
    v6 = v6 + v11;
    if (v9)
      v10 = v8;
    v4 = v4 + v10;
  }
  v12 = 0.0;
  v13 = 0.0;
  v14 = v4;
  v15 = v6;
  result.right = v15;
  result.bottom = v13;
  result.left = v14;
  result.top = v12;
  return result;
}

- (id)viewForLastBaselineLayout
{
  return (id)-[_UIAtomTextViewAtomLayout viewForLastBaselineLayout](self->_delegateView, "viewForLastBaselineLayout");
}

- (BOOL)isEnabled
{
  return -[_UIAtomTextViewAtomLayout isEnabled](self->_delegateView, "isEnabled");
}

- (void)setEnabled:(BOOL)a3
{
  -[_UIAtomTextViewAtomLayout setEnabled:](self->_delegateView, "setEnabled:", a3);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
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
  CGSize result;

  -[_UIAtomTextViewAtomLayout systemLayoutSizeFittingSize:](self->_delegateView, "systemLayoutSizeFittingSize:", a3.width, a3.height);
  v5 = v4;
  v7 = v6;
  -[_UISearchTokenLayoutView atomInsets](self, "atomInsets");
  v10 = v5 + v8 + v9;
  v13 = v7 + v11 + v12;
  v14 = v10;
  result.height = v13;
  result.width = v14;
  return result;
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
  double v15;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)_UISearchTokenLayoutView;
  -[UIView layoutSubviews](&v16, sel_layoutSubviews);
  -[UIView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[_UISearchTokenLayoutView atomInsets](self, "atomInsets");
  v12 = v4 + v11;
  v13 = v6 - self->_verticalDelegateViewOrigin;
  -[_UIAtomTextViewAtomLayout systemLayoutSizeFittingSize:](self->_delegateView, "systemLayoutSizeFittingSize:", v8, v10);
  -[_UIAtomTextViewAtomLayout setFrame:](self->_delegateView, "setFrame:", v12, v13, v14, v15);
}

- (CGRect)selectionBounds
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  -[_UIAtomTextViewAtomLayout bounds](self->_delegateView, "bounds");
  -[UIView convertRect:fromView:](self, "convertRect:fromView:", self->_delegateView);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (CGRect)boundsForTextContainer:(id)a3 proposedLineFragment:(CGRect)a4 glyphPosition:(CGPoint)a5
{
  double v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  CGFloat Height;
  _UIAtomTextViewAtomLayout *delegateView;
  double v14;
  double v15;
  double v16;
  double v17;
  CGRect v18;
  CGRect v19;
  CGRect result;

  -[UIView layoutIfNeeded](self, "layoutIfNeeded", a3, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height, a5.x, a5.y);
  v6 = *MEMORY[0x1E0C9D648];
  -[_UISearchTokenLayoutView sizeThatFits:](self, "sizeThatFits:", *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
  v8 = v7;
  -[_UISearchTokenLayoutView viewForLastBaselineLayout](self, "viewForLastBaselineLayout");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_baselineOffsetFromBottom");
  v11 = -v10;
  objc_msgSend(v9, "bounds");
  Height = CGRectGetHeight(v18);
  delegateView = self->_delegateView;
  objc_msgSend(v9, "bounds");
  -[_UIAtomTextViewAtomLayout convertRect:fromView:](delegateView, "convertRect:fromView:", v9);
  self->_verticalDelegateViewOrigin = CGRectGetMinY(v19);

  v14 = v6;
  v15 = v11;
  v16 = v8;
  v17 = Height;
  result.size.height = v17;
  result.size.width = v16;
  result.origin.y = v15;
  result.origin.x = v14;
  return result;
}

- (void)updateMaskLayerForAttachmentRect:(CGRect)a3 lineFragment:(CGRect)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGFloat v8;
  double v9;
  CGFloat v10;
  CGFloat v11;
  _BOOL4 v13;
  _BOOL4 v14;
  CGFloat v15;
  double MinX;
  _BOOL4 v17;
  void *v18;
  double v19;
  CGFloat v20;
  CGFloat v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  CGFloat v27;
  CGFloat v28;
  CGFloat v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  double v36;
  double v37;
  double v38;
  double verticalDelegateViewOrigin;
  double v40;
  double v41;
  void *v42;
  void *v43;
  double MaxX;
  double v45;
  CGFloat v46;
  CGRect remainder;
  CGRect slice;
  _QWORD v49[2];
  _QWORD v50[2];
  _QWORD v51[2];
  _QWORD v52[4];
  _QWORD v53[5];
  CGRect v54;
  CGRect v55;
  CGRect v56;
  CGRect v57;
  CGRect v58;
  CGRect v59;
  CGRect v60;
  CGRect v61;
  CGRect v62;
  CGRect v63;
  CGRect v64;
  CGRect v65;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v8 = a3.size.height;
  v9 = a3.size.width;
  v10 = a3.origin.y;
  v11 = a3.origin.x;
  v53[4] = *MEMORY[0x1E0C80C00];
  v13 = CGRectIntersectsRect(a3, a4);
  v45 = v9;
  v46 = v11;
  if (v13)
  {
    v54.origin.x = v11;
    v54.origin.y = v10;
    v54.size.width = v9;
    v54.size.height = v8;
    MaxX = CGRectGetMaxX(v54);
    v55.origin.x = x;
    v55.origin.y = y;
    v55.size.width = width;
    v55.size.height = height;
    v14 = MaxX > CGRectGetMaxX(v55);
    v56.origin.x = v11;
    v15 = v10;
    v56.origin.y = v10;
    v56.size.width = v9;
    v56.size.height = v8;
    MinX = CGRectGetMinX(v56);
    v57.origin.x = x;
    v57.origin.y = y;
    v57.size.width = width;
    v57.size.height = height;
    v17 = MinX < CGRectGetMinX(v57);
    if (v17)
      goto LABEL_7;
  }
  else
  {
    v15 = v10;
    v14 = 0;
    v17 = 0;
  }
  if (!v14)
  {
    -[UIView layer](self, "layer");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setMask:", 0);

    -[UIView setHidden:](self, "setHidden:", !v13);
    return;
  }
LABEL_7:
  v58.origin.x = x;
  v58.origin.y = y;
  v58.size.width = width;
  v58.size.height = height;
  v65.origin.x = v46;
  v65.origin.y = v15;
  v65.size.width = v9;
  v65.size.height = v8;
  v59 = CGRectIntersection(v58, v65);
  v19 = v59.origin.x;
  v20 = v59.origin.y;
  v21 = v59.size.width;
  v59.origin.x = v46;
  v59.origin.y = v15;
  v59.size.width = v9;
  v59.size.height = v8;
  v22 = CGRectGetMinX(v59);
  if (qword_1ECD7A4F0 != -1)
    dispatch_once(&qword_1ECD7A4F0, &__block_literal_global_72);
  v23 = v19 - v22;
  memset(&slice, 0, sizeof(slice));
  if (v14)
  {
    v24 = v8;
    slice.origin.x = v46;
    slice.origin.y = v15;
    MaxX = v15;
    slice.size.width = v9;
    slice.size.height = v8;
    v60.origin.x = v23;
    v60.origin.y = v20;
    v60.size.width = v21;
    v60.size.height = v8;
    v25 = (CGRectGetMaxX(v60) + -50.0) / v9;
    v61.origin.x = v23;
    v61.origin.y = v20;
    v61.size.width = v21;
    v61.size.height = v8;
    v26 = CGRectGetMaxX(v61) / v45;
    if (v17)
    {
      v62.origin.x = v23;
      v62.origin.y = v20;
      v62.size.width = v21;
      v62.size.height = v8;
      v27 = CGRectGetMinX(v62) / v45;
      v63.origin.x = v23;
      v63.origin.y = v20;
      v63.size.width = v21;
      v63.size.height = v8;
      v28 = CGRectGetMinX(v63);
      v53[0] = _MergedGlobals_3_3;
      v53[1] = qword_1ECD7A4E8;
      v53[2] = qword_1ECD7A4E8;
      v53[3] = _MergedGlobals_3_3;
      v29 = (v28 + 50.0) / v45;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v53, 4);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v27);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v52[0] = v31;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v29);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v52[1] = v32;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v25);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v52[2] = v33;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v26);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v52[3] = v34;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v52, 4);
      v35 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v51[0] = qword_1ECD7A4E8;
      v51[1] = _MergedGlobals_3_3;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v51, 2);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v25);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v50[0] = v31;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v26);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v50[1] = v32;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v50, 2);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
    }

    v37 = MaxX;
    v36 = v46;
    v38 = v45;
  }
  else
  {
    memset(&remainder, 0, sizeof(remainder));
    v64.origin.x = v23;
    v64.origin.y = v20;
    v64.size.width = v21;
    v64.size.height = v8;
    CGRectDivide(v64, &slice, &remainder, 50.0, CGRectMinXEdge);
    v49[0] = _MergedGlobals_3_3;
    v49[1] = qword_1ECD7A4E8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v49, 2);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = slice.origin.x;
    v37 = slice.origin.y;
    v35 = &unk_1E1A92BD0;
    v38 = slice.size.width;
    v24 = slice.size.height;
  }
  verticalDelegateViewOrigin = self->_verticalDelegateViewOrigin;
  v40 = v24 + verticalDelegateViewOrigin + verticalDelegateViewOrigin;
  v41 = -verticalDelegateViewOrigin;
  objc_msgSend(MEMORY[0x1E0CD2790], "layer", *(_QWORD *)&MaxX);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "setColors:", v30);
  objc_msgSend(v42, "setLocations:", v35);
  objc_msgSend(v42, "setStartPoint:", 0.0, 0.5);
  objc_msgSend(v42, "setEndPoint:", 1.0, 0.5);
  objc_msgSend(v42, "setAnchorPoint:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));
  objc_msgSend(v42, "setBounds:", v36, v37, v38, v40);
  objc_msgSend(v42, "setPosition:", 0.0, v41);
  -[UIView layer](self, "layer");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "setMask:", v42);

  -[UIView setHidden:](self, "setHidden:", 0);
}

- (void)updateMaskLayerForVisibleRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  void *v16;
  _UISearchTokenLayoutView *v17;
  uint64_t v18;
  double v19;
  CGFloat v20;
  double MinX;
  double MaxX;
  double v23;
  id v24;
  uint64_t v25;
  id v26;
  uint64_t v27;
  void *v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  CGFloat v37;
  double v38;
  double v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  double v45;
  double v46;
  double MidX;
  double MidY;
  double v49;
  void *v50;
  void *v51;
  void *v52;
  double v53;
  double v54;
  double v55;
  CGFloat v56;
  _QWORD v57[6];
  _QWORD v58[7];
  CGRect v59;
  CGRect v60;
  CGRect v61;
  CGRect v62;
  CGRect v63;
  CGRect v64;
  CGRect v65;
  CGRect v66;
  CGRect v67;
  CGRect v68;
  CGRect v69;
  CGRect v70;
  CGRect v71;
  CGRect v72;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v58[6] = *MEMORY[0x1E0C80C00];
  -[UIView bounds](self, "bounds");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v59.origin.x = x;
  v59.origin.y = y;
  v59.size.width = width;
  v59.size.height = height;
  v71.origin.x = v9;
  v71.origin.y = v11;
  v71.size.width = v13;
  v71.size.height = v15;
  if (CGRectContainsRect(v59, v71))
  {
    -[UIView layer](self, "layer");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setMask:", 0);

    v17 = self;
    v18 = 0;
LABEL_10:
    -[UIView setHidden:](v17, "setHidden:", v18);
    return;
  }
  v60.origin.x = v9;
  v60.origin.y = v11;
  v60.size.width = v13;
  v60.size.height = v15;
  v72.origin.x = x;
  v72.origin.y = y;
  v72.size.width = width;
  v72.size.height = height;
  if (!CGRectIntersectsRect(v60, v72))
  {
    -[UIView layer](self, "layer");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "setMask:", 0);

    v17 = self;
    v18 = 1;
    goto LABEL_10;
  }
  v61.origin.x = v9;
  v61.origin.y = v11;
  v61.size.width = v13;
  v61.size.height = v15;
  v55 = v13;
  v19 = v15;
  v20 = v11;
  MinX = CGRectGetMinX(v61);
  v62.origin.x = x;
  v62.origin.y = y;
  v62.size.width = width;
  v62.size.height = height;
  v53 = MinX - CGRectGetMinX(v62);
  v63.origin.y = v20;
  v56 = v9;
  v63.origin.x = v9;
  v63.size.width = v55;
  v63.size.height = v19;
  MaxX = CGRectGetMaxX(v63);
  v64.origin.x = x;
  v64.origin.y = y;
  v64.size.width = width;
  v64.size.height = height;
  v23 = MaxX - CGRectGetMaxX(v64);
  +[UIColor clearColor](UIColor, "clearColor");
  v24 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v25 = objc_msgSend(v24, "CGColor");

  +[UIColor whiteColor](UIColor, "whiteColor");
  v26 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v27 = objc_msgSend(v26, "CGColor");

  v58[0] = v25;
  v58[1] = v25;
  v58[2] = v27;
  v58[3] = v27;
  v58[4] = v25;
  v58[5] = v25;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v58, 6);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = 0.0;
  v30 = 0.0;
  if (v53 < -3.0)
  {
    v65.origin.x = x;
    v65.origin.y = y;
    v65.size.width = width;
    v65.size.height = height;
    v54 = v23;
    v31 = CGRectGetMinX(v65);
    v66.origin.y = v20;
    v66.origin.x = v56;
    v66.size.width = v55;
    v66.size.height = v19;
    v32 = v31 - CGRectGetMinX(v66);
    v23 = v54;
    v30 = v32 / v55;
    v29 = 50.0 / v55 + v32 / v55;
  }
  v33 = 1.0;
  v34 = 1.0;
  if (v23 > 3.0)
  {
    v67.origin.x = x;
    v35 = v30;
    v67.origin.y = y;
    v67.size.width = width;
    v67.size.height = height;
    v36 = CGRectGetMaxX(v67);
    v68.origin.y = v20;
    v68.origin.x = v56;
    v68.size.width = v55;
    v68.size.height = v19;
    v37 = CGRectGetMinX(v68);
    v30 = v35;
    v33 = (v36 - v37) / v55;
    v34 = v33 + -50.0 / v55;
  }
  v57[0] = &unk_1E1A96FF0;
  v38 = v34;
  v39 = v33;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v30);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v57[1] = v40;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v29);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v57[2] = v41;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v38);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v57[3] = v42;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v39);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v57[4] = v43;
  v57[5] = &unk_1E1A97008;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v57, 6);
  v44 = (void *)objc_claimAutoreleasedReturnValue();

  v45 = *MEMORY[0x1E0C9D538];
  v46 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  v69.origin.x = v56;
  v69.origin.y = v20;
  v69.size.width = v55;
  v69.size.height = v19;
  MidX = CGRectGetMidX(v69);
  v70.origin.x = v56;
  v70.origin.y = v20;
  v70.size.width = v55;
  v70.size.height = v19;
  MidY = CGRectGetMidY(v70);
  v49 = v19 + self->_verticalDelegateViewOrigin + self->_verticalDelegateViewOrigin;
  objc_msgSend(MEMORY[0x1E0CD2790], "layer");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "setColors:", v28);
  objc_msgSend(v50, "setLocations:", v44);
  objc_msgSend(v50, "setStartPoint:", 0.0, 0.5);
  objc_msgSend(v50, "setEndPoint:", 1.0, 0.5);
  objc_msgSend(v50, "setBounds:", v45, v46, v55, v49);
  objc_msgSend(v50, "setPosition:", MidX, MidY);
  -[UIView layer](self, "layer");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "setMask:", v50);

  -[UIView setHidden:](self, "setHidden:", 0);
}

- (id)targetedDragPreviewInContainerView:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  _UIAtomTextViewAtomLayout *v13;
  void *v14;
  void *v15;
  UIDragPreviewTarget *v16;
  UITargetedDragPreview *v17;

  v4 = a3;
  -[_UISearchTokenLayoutView selectionBounds](self, "selectionBounds");
  objc_msgSend(v4, "convertRect:fromView:", self);
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v13 = self->_delegateView;
  v14 = (void *)objc_opt_new();
  +[UIColor clearColor](UIColor, "clearColor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setBackgroundColor:", v15);

  v16 = -[UIPreviewTarget initWithContainer:center:]([UIDragPreviewTarget alloc], "initWithContainer:center:", v4, v6 + v10 * 0.5, v8 + v12 * 0.5);
  v17 = -[UITargetedDragPreview initWithView:parameters:target:]([UITargetedDragPreview alloc], "initWithView:parameters:target:", v13, v14, v16);

  return v17;
}

- (_UIAtomTextViewAtomLayout)delegateView
{
  return self->_delegateView;
}

- (void)setDelegateView:(id)a3
{
  objc_storeStrong((id *)&self->_delegateView, a3);
}

- (BOOL)isLastSearchToken
{
  return self->_isLastSearchToken;
}

- (void)setIsLastSearchToken:(BOOL)a3
{
  self->_isLastSearchToken = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegateView, 0);
}

@end
