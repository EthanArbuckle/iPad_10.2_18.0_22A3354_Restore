@implementation ICScrollViewKeyboardResizer

- (void)startAutoResizing
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  id v17;

  -[ICScrollViewKeyboardResizer scrollView](self, "scrollView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "layoutIfNeeded");

  if (!-[ICScrollViewKeyboardResizer isObservingKeyboardNotifications](self, "isObservingKeyboardNotifications"))
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObserver:selector:name:object:", self, sel_handleKeyboardWillShow_, *MEMORY[0x1E0DC4FE8], 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObserver:selector:name:object:", self, sel_handleKeyboardDidShow_, *MEMORY[0x1E0DC4E70], 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObserver:selector:name:object:", self, sel_handleKeyboardWillHide_, *MEMORY[0x1E0DC4FE0], 0);

    -[ICScrollViewKeyboardResizer setObservingKeyboardNotifications:](self, "setObservingKeyboardNotifications:", 1);
  }
  objc_msgSend(MEMORY[0x1E0DC3938], "activeKeyboard");
  v17 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "window");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    +[ICKeyboardNotificationListener sharedListener](ICKeyboardNotificationListener, "sharedListener");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "currentKeyboardFrame");
    v10 = v9;
    v12 = v11;
    v14 = v13;
    v16 = v15;

    -[ICScrollViewKeyboardResizer applyInsetsFromKeyboardFrame:duration:](self, "applyInsetsFromKeyboardFrame:duration:", v10, v12, v14, v16, 0.0);
  }
  else if (-[ICScrollViewKeyboardResizer didResizeScrollView](self, "didResizeScrollView"))
  {
    -[ICScrollViewKeyboardResizer clearInsetsWithDuration:](self, "clearInsetsWithDuration:", 0.0);
  }
  -[ICScrollViewKeyboardResizer setAutoResizing:](self, "setAutoResizing:", 1);

}

- (void)setObservingKeyboardNotifications:(BOOL)a3
{
  self->_observingKeyboardNotifications = a3;
}

- (void)setAutoResizing:(BOOL)a3
{
  self->_autoResizing = a3;
}

- (UIScrollView)scrollView
{
  void *v2;
  void *v3;

  -[ICScrollViewKeyboardResizer delegate](self, "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "keyboardResizerScrollView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIScrollView *)v3;
}

- (BOOL)isObservingKeyboardNotifications
{
  return self->_observingKeyboardNotifications;
}

- (BOOL)isAutoResizing
{
  return self->_autoResizing;
}

- (ICScrollViewKeyboardResizer)initWithDelegate:(id)a3
{
  id v4;
  ICScrollViewKeyboardResizer *v5;
  ICScrollViewKeyboardResizer *v6;
  id v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ICScrollViewKeyboardResizer;
  v5 = -[ICScrollViewKeyboardResizer init](&v9, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_delegate, v4);
    v7 = +[ICKeyboardNotificationListener sharedListener](ICKeyboardNotificationListener, "sharedListener");
  }

  return v6;
}

- (BOOL)didResizeScrollView
{
  return self->_didResizeScrollView;
}

- (ICScrollViewKeyboardResizerDelegate)delegate
{
  return (ICScrollViewKeyboardResizerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (ICScrollViewKeyboardResizer)init
{
  return -[ICScrollViewKeyboardResizer initWithDelegate:](self, "initWithDelegate:", 0);
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)ICScrollViewKeyboardResizer;
  -[ICScrollViewKeyboardResizer dealloc](&v4, sel_dealloc);
}

- (void)stopAutoResizing
{
  void *v3;

  if (-[ICScrollViewKeyboardResizer isObservingKeyboardNotifications](self, "isObservingKeyboardNotifications"))
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeObserver:", self);

    -[ICScrollViewKeyboardResizer setObservingKeyboardNotifications:](self, "setObservingKeyboardNotifications:", 0);
  }
  -[ICScrollViewKeyboardResizer setAutoResizing:](self, "setAutoResizing:", 0);
}

- (void)reapplyInsets
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  id v13;

  objc_msgSend(MEMORY[0x1E0DC3938], "activeKeyboard");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    +[ICKeyboardNotificationListener sharedListener](ICKeyboardNotificationListener, "sharedListener");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "currentKeyboardFrame");
    v6 = v5;
    v8 = v7;
    v10 = v9;
    v12 = v11;

    -[ICScrollViewKeyboardResizer applyInsetsFromKeyboardFrame:duration:](self, "applyInsetsFromKeyboardFrame:duration:", v6, v8, v10, v12, 0.0);
  }
  else
  {
    -[ICScrollViewKeyboardResizer clearInsetsWithDuration:](self, "clearInsetsWithDuration:", 0.0);
  }

}

- (void)applyInsetsFromKeyboardFrame:(CGRect)a3 duration:(double)a4
{
  double height;
  CGFloat width;
  double y;
  double x;
  void *v9;
  void *v10;
  int v11;
  double v12;
  int v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  uint64_t v28;
  double v29;
  CGFloat v30;
  double v31;
  CGFloat v32;
  double v33;
  CGFloat v34;
  double v35;
  CGFloat v36;
  double MaxY;
  double v38;
  void *v39;
  void *v40;
  double v41;
  CGFloat v42;
  double v43;
  CGFloat v44;
  double v45;
  CGFloat v46;
  double v47;
  CGFloat v48;
  CGFloat v49;
  CGFloat v50;
  CGFloat v51;
  CGFloat v52;
  CGFloat v53;
  CGFloat v54;
  CGFloat v55;
  CGFloat v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  void *v66;
  double v67;
  double v68;
  double v69;
  double v70;
  void *v71;
  char v72;
  void *v73;
  double v74;
  double v75;
  double v76;
  double v77;
  double v79;
  double v80;
  double v81;
  _QWORD v82[5];
  CGRect v83;
  CGRect v84;
  CGRect v85;
  CGRect v86;
  CGRect v87;
  CGRect v88;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[ICScrollViewKeyboardResizer delegate](self, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[ICScrollViewKeyboardResizer delegate](self, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "keyboardResizerAutoscrollAboveKeyboard");

    v12 = 0.0;
    if (v11)
    {
      v13 = objc_msgSend(MEMORY[0x1E0DC3708], "ic_isLargeiPad");
      v12 = 60.0;
      if (v13)
        y = y + -60.0;
      else
        v12 = 0.0;
      if (v13)
        height = height + 60.0;
    }
  }
  else
  {

    v12 = 0.0;
  }
  v75 = v12;
  if (!ICInternalSettingsIsTextKit2Enabled()
    || (-[ICScrollViewKeyboardResizer scrollView](self, "scrollView"),
        v14 = (void *)objc_claimAutoreleasedReturnValue(),
        v15 = objc_msgSend(v14, "isFirstResponder"),
        v14,
        v15))
  {
    v82[0] = MEMORY[0x1E0C809B0];
    v82[1] = 3221225472;
    v82[2] = __69__ICScrollViewKeyboardResizer_applyInsetsFromKeyboardFrame_duration___block_invoke;
    v82[3] = &unk_1E5C1D540;
    v82[4] = self;
    objc_msgSend(MEMORY[0x1E0DC3F10], "performWithoutAnimation:", v82, *(_QWORD *)&v75);
    -[ICScrollViewKeyboardResizer scrollView](self, "scrollView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "layoutIfNeeded");

  }
  -[ICScrollViewKeyboardResizer scrollView](self, "scrollView", *(_QWORD *)&v75);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICScrollViewKeyboardResizer scrollView](self, "scrollView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "bounds");
  objc_msgSend(v17, "convertRect:toView:", 0);
  v20 = v19;
  v22 = v21;
  v24 = v23;
  v26 = v25;

  -[ICScrollViewKeyboardResizer scrollView](self, "scrollView");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "window");
  v28 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v28, "convertRect:toWindow:", 0, v20, v22, v24, v26);
  v30 = v29;
  v32 = v31;
  v34 = v33;
  v36 = v35;

  v83.origin.x = x;
  v83.origin.y = y;
  v83.size.width = width;
  v83.size.height = height;
  v80 = width;
  MaxY = CGRectGetMaxY(v83);
  v84.origin.x = v30;
  v84.origin.y = v32;
  v84.size.width = v34;
  v84.size.height = v36;
  v38 = height - fmax(MaxY - CGRectGetMaxY(v84), 0.0);
  -[ICScrollViewKeyboardResizer delegate](self, "delegate");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v28) = objc_opt_respondsToSelector();

  if ((v28 & 1) != 0)
  {
    -[ICScrollViewKeyboardResizer delegate](self, "delegate");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "keyboardResizerAdjustInsetsWithKeyboardFrame:scrollAboveHeight:duration:", x, y, v80, v38, v76, a4);
  }
  else
  {
    -[ICScrollViewKeyboardResizer scrollView](self, "scrollView");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "convertRect:fromView:", 0, x, y, v80, v38);
    v42 = v41;
    v44 = v43;
    v46 = v45;
    v48 = v47;
    objc_msgSend(v40, "bounds");
    v88.origin.x = v49;
    v88.origin.y = v50;
    v88.size.width = v51;
    v88.size.height = v52;
    v85.origin.x = v42;
    v85.origin.y = v44;
    v85.size.width = v46;
    v85.size.height = v48;
    v86 = CGRectIntersection(v85, v88);
    v53 = v86.origin.x;
    v54 = v86.origin.y;
    v55 = v86.size.width;
    v56 = v86.size.height;
    objc_msgSend(v40, "contentInset");
    v58 = v57;
    v79 = v59;
    v81 = v60;
    objc_msgSend(v40, "verticalScrollIndicatorInsets");
    v62 = v61;
    v64 = v63;
    v77 = v65;
    -[ICScrollViewKeyboardResizer delegate](self, "delegate");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "consumedBottomAreaForResizer:", self);
    v68 = v67;

    v87.origin.x = v53;
    v87.origin.y = v54;
    v87.size.width = v55;
    v87.size.height = v56;
    v69 = CGRectGetHeight(v87);
    if (v68 >= v69)
      v70 = v68;
    else
      v70 = v69;
    -[ICScrollViewKeyboardResizer delegate](self, "delegate");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    v72 = objc_opt_respondsToSelector();

    if ((v72 & 1) != 0)
    {
      -[ICScrollViewKeyboardResizer delegate](self, "delegate");
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v73, "topInsetForResizer:", self);
      v58 = v74;

      v62 = v58;
    }
    objc_msgSend(v40, "setContentInset:", v58, v79, v70, v81);
    objc_msgSend(v40, "setScrollIndicatorInsets:", v62, v64, v70, v77);
  }

  -[ICScrollViewKeyboardResizer setDidResizeScrollView:](self, "setDidResizeScrollView:", 1);
}

void __69__ICScrollViewKeyboardResizer_applyInsetsFromKeyboardFrame_duration___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "scrollView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "window");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "layoutIfNeeded");

}

- (void)clearInsetsWithDuration:(double)a3
{
  void *v5;
  char v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  char v24;
  void *v25;
  double v26;

  -[ICScrollViewKeyboardResizer delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[ICScrollViewKeyboardResizer delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "keyboardResizerAdjustInsetsWithKeyboardFrame:scrollAboveHeight:duration:", *MEMORY[0x1E0C9D628], *(double *)(MEMORY[0x1E0C9D628] + 8), *(double *)(MEMORY[0x1E0C9D628] + 16), *(double *)(MEMORY[0x1E0C9D628] + 24), 0.0, a3);
  }
  else
  {
    -[ICScrollViewKeyboardResizer scrollView](self, "scrollView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICScrollViewKeyboardResizer delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "consumedBottomAreaForResizer:", self);
    v10 = v9;

    objc_msgSend(v7, "contentInset");
    v12 = v11;
    v14 = v13;
    v16 = v15;
    objc_msgSend(v7, "verticalScrollIndicatorInsets");
    v18 = v17;
    v20 = v19;
    v22 = v21;
    -[ICScrollViewKeyboardResizer delegate](self, "delegate");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_opt_respondsToSelector();

    if ((v24 & 1) != 0)
    {
      -[ICScrollViewKeyboardResizer delegate](self, "delegate");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "topInsetForResizer:", self);
      v18 = v26;

      v12 = v18;
    }
    objc_msgSend(v7, "setContentInset:", v12, v14, v10, v16);
    objc_msgSend(v7, "setScrollIndicatorInsets:", v18, v20, v10, v22);
  }

  -[ICScrollViewKeyboardResizer setDidResizeScrollView:](self, "setDidResizeScrollView:", 0);
}

- (void)handleKeyboardWillShow:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  uint64_t v21;
  _QWORD v22[10];

  v4 = a3;
  -[ICScrollViewKeyboardResizer setShowingKeyboard:](self, "setShowingKeyboard:", 1);
  objc_msgSend(v4, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", *MEMORY[0x1E0DC4E90]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "CGRectValue");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;

  objc_msgSend(v4, "userInfo");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "objectForKey:", *MEMORY[0x1E0DC4E48]);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "doubleValue");
  v18 = v17;

  objc_msgSend(v4, "userInfo");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v19, "objectForKey:", *MEMORY[0x1E0DC4E40]);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "unsignedIntegerValue");

  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __54__ICScrollViewKeyboardResizer_handleKeyboardWillShow___block_invoke;
  v22[3] = &unk_1E5C1E9E0;
  v22[4] = self;
  v22[5] = v8;
  v22[6] = v10;
  v22[7] = v12;
  v22[8] = v14;
  *(double *)&v22[9] = v18;
  objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:delay:options:animations:completion:", v21 << 16, v22, 0, v18, 0.0);
}

uint64_t __54__ICScrollViewKeyboardResizer_handleKeyboardWillShow___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "applyInsetsFromKeyboardFrame:duration:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
}

- (void)handleKeyboardDidShow:(id)a3
{
  -[ICScrollViewKeyboardResizer setFullyShowingKeyboard:](self, "setFullyShowingKeyboard:", 1);
}

- (void)handleKeyboardWillHide:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  uint64_t v11;
  _QWORD v12[6];

  v4 = a3;
  -[ICScrollViewKeyboardResizer setShowingKeyboard:](self, "setShowingKeyboard:", 0);
  -[ICScrollViewKeyboardResizer setFullyShowingKeyboard:](self, "setFullyShowingKeyboard:", 0);
  objc_msgSend(v4, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", *MEMORY[0x1E0DC4E48]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "doubleValue");
  v8 = v7;

  objc_msgSend(v4, "userInfo");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "objectForKey:", *MEMORY[0x1E0DC4E40]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "unsignedIntegerValue");

  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __54__ICScrollViewKeyboardResizer_handleKeyboardWillHide___block_invoke;
  v12[3] = &unk_1E5C1E560;
  v12[4] = self;
  *(double *)&v12[5] = v8;
  objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:delay:options:animations:completion:", v11 << 16, v12, 0, v8, 0.0);
}

uint64_t __54__ICScrollViewKeyboardResizer_handleKeyboardWillHide___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "clearInsetsWithDuration:", *(double *)(a1 + 40));
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)showingKeyboard
{
  return self->_showingKeyboard;
}

- (void)setShowingKeyboard:(BOOL)a3
{
  self->_showingKeyboard = a3;
}

- (BOOL)fullyShowingKeyboard
{
  return self->_fullyShowingKeyboard;
}

- (void)setFullyShowingKeyboard:(BOOL)a3
{
  self->_fullyShowingKeyboard = a3;
}

- (void)setDidResizeScrollView:(BOOL)a3
{
  self->_didResizeScrollView = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
