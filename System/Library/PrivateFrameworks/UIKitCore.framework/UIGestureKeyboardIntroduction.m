@implementation UIGestureKeyboardIntroduction

- (UIGestureKeyboardIntroduction)initWithLayoutStar:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  UIGestureKeyboardIntroduction *v9;
  UIGestureKeyboardIntroduction *v10;
  uint64_t v11;
  id m_completionBlock;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)UIGestureKeyboardIntroduction;
  v9 = -[UIGestureKeyboardIntroduction init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->m_layout, a3);
    v11 = objc_msgSend(v8, "copy");
    m_completionBlock = v10->m_completionBlock;
    v10->m_completionBlock = (id)v11;

  }
  return v10;
}

- (BOOL)showGestureKeyboardIntroduction
{
  UIGestureKeyboardIntroduction *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unint64_t v9;
  id v10;
  BOOL v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
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
  UIView *v33;
  uint64_t v34;
  UIView *m_view;
  void *v36;
  id v37;
  void (**v38)(void *, void *, uint64_t);
  uint64_t v39;
  UIKBKeyView *m_firstKeyView;
  uint64_t v41;
  UIKBKeyView *m_secondKeyView;
  double v43;
  double v44;
  UILabel *v45;
  UILabel *v46;
  double v47;
  double v48;
  double v49;
  uint64_t v50;
  void *v51;
  id m_completionBlock;
  void *v54;
  void *v55;
  uint64_t v56;
  void *v57;
  uint64_t v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  id v63;
  void *v64;
  void *v65;
  double v66;
  double v67;
  double v68;
  double v69;
  uint64_t v70;
  NSTimer *m_gestureKeyboardInfoTimer;
  uint64_t v72;
  uint64_t v73;
  void *v74;
  void *v75;
  void (**v76)(void *, void *, uint64_t);
  void *v77;
  void *v78;
  void *v79;
  UIGestureKeyboardIntroduction *v80;
  UILabel *v81;
  _QWORD aBlock[5];
  id v83;
  id v84;
  id v85;
  _QWORD v86[2];
  _QWORD v87[2];
  _QWORD v88[2];
  _QWORD v89[4];

  v2 = self;
  v89[2] = *MEMORY[0x1E0C80C00];
  -[UIKeyboardLayoutStar currentKeyplane](self->m_layout, "currentKeyplane");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKeyboardLayoutStar currentKeyplaneView](v2->m_layout, "currentKeyplaneView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "subtrees");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "keySet");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "subtrees");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  if (v9 > 1)
  {
    objc_msgSend(v6, "keySet");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "subtrees");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)objc_msgSend(v13, "count") < 2)
    {
      v16 = 0;
    }
    else
    {
      objc_msgSend(v6, "keySet");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "subtrees");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "objectAtIndexedSubscript:", 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(v16, "subtrees");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)objc_msgSend(v17, "count") < 4)
    {
      v19 = 0;
    }
    else
    {
      objc_msgSend(v16, "subtrees");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "objectAtIndexedSubscript:", 3);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(v6, "keySet");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "subtrees");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v21, "count"))
    {
      objc_msgSend(v6, "keySet");
      v80 = v2;
      v22 = v6;
      v23 = v3;
      v24 = v4;
      v25 = v19;
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "subtrees");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "objectAtIndexedSubscript:", 0);
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      v16 = v26;
      v19 = v25;
      v4 = v24;
      v3 = v23;
      v6 = v22;
      v2 = v80;
    }
    else
    {
      v28 = 0;
    }

    objc_msgSend(v28, "subtrees");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)objc_msgSend(v29, "count") <= 4)
    {

      v31 = 0;
    }
    else
    {
      objc_msgSend(v28, "subtrees");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "objectAtIndexedSubscript:", 4);
      v31 = (void *)objc_claimAutoreleasedReturnValue();

      if (v19
        && v31
        && objc_msgSend(v19, "displayTypeHint") == 10
        && objc_msgSend(v31, "displayTypeHint") == 10)
      {
        +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "setHidden:", 1);
        v33 = [UIView alloc];
        objc_msgSend(v32, "frame");
        v34 = -[UIView initWithFrame:](v33, "initWithFrame:");
        m_view = v2->m_view;
        v2->m_view = (UIView *)v34;

        objc_msgSend(v32, "superview");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "addSubview:", v2->m_view);

        aBlock[0] = MEMORY[0x1E0C809B0];
        aBlock[1] = 3221225472;
        aBlock[2] = __64__UIGestureKeyboardIntroduction_showGestureKeyboardIntroduction__block_invoke;
        aBlock[3] = &unk_1E16CF100;
        aBlock[4] = v2;
        v83 = v4;
        v84 = v3;
        v37 = v32;
        v85 = v37;
        v38 = (void (**)(void *, void *, uint64_t))_Block_copy(aBlock);
        v78 = v19;
        v38[2](v38, v19, 1);
        v39 = objc_claimAutoreleasedReturnValue();
        m_firstKeyView = v2->m_firstKeyView;
        v2->m_firstKeyView = (UIKBKeyView *)v39;

        v76 = v38;
        v38[2](v38, v31, 0);
        v41 = objc_claimAutoreleasedReturnValue();
        m_secondKeyView = v2->m_secondKeyView;
        v2->m_secondKeyView = (UIKBKeyView *)v41;

        -[UIView size](v2->m_view, "size");
        v44 = v43;
        v45 = [UILabel alloc];
        v46 = -[UILabel initWithFrame:](v45, "initWithFrame:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8), v44, 60.0);
        -[UIView center](v2->m_view, "center");
        v48 = v47;
        -[UIView size](v2->m_view, "size");
        -[UIView setCenter:](v46, "setCenter:", v48, v49 * 0.25);
        -[UILabel setUserInteractionEnabled:](v46, "setUserInteractionEnabled:", 0);
        -[UILabel setNumberOfLines:](v46, "setNumberOfLines:", 0);
        v81 = v46;
        -[UILabel setTextAlignment:](v46, "setTextAlignment:", 1);
        _UINSLocalizedStringWithDefaultValue(CFSTR("To access the alternate letters on the keyboard,\npull down on the key and release."), CFSTR("To access the alternate letters on the keyboard,\npull down on the key and release."));
        v79 = (void *)objc_claimAutoreleasedReturnValue();
        v88[0] = *(_QWORD *)off_1E1678D98;
        v50 = v88[0];
        -[UIKeyboardLayoutStar renderConfig](v2->m_layout, "renderConfig");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        v77 = v37;
        v73 = v50;
        if (objc_msgSend(v51, "whiteText"))
          +[UIColor whiteColor](UIColor, "whiteColor");
        else
          +[UIColor grayColor](UIColor, "grayColor");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        v89[0] = v54;
        v72 = *(_QWORD *)off_1E1678D90;
        v88[1] = *(_QWORD *)off_1E1678D90;
        objc_msgSend(off_1E167A828, "systemFontOfSize:", 17.0);
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        v89[1] = v55;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v89, v88, 2);
        v56 = objc_claimAutoreleasedReturnValue();

        v75 = (void *)v56;
        v57 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", v79, v56);
        -[UILabel setAttributedText:](v81, "setAttributedText:", v57);

        -[UIView addSubview:](v2->m_view, "addSubview:", v81);
        +[UIButton buttonWithType:](UIButton, "buttonWithType:", 1);
        v58 = objc_claimAutoreleasedReturnValue();
        v86[0] = v73;
        -[UIKeyboardLayoutStar renderConfig](v2->m_layout, "renderConfig");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        v74 = (void *)v58;
        if (objc_msgSend(v59, "whiteText"))
          +[UIColor whiteColor](UIColor, "whiteColor");
        else
          +[UIColor systemBlueColor](UIColor, "systemBlueColor");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        v86[1] = v72;
        v87[0] = v60;
        objc_msgSend(off_1E167A828, "systemFontOfSize:", 17.0);
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        v87[1] = v61;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v87, v86, 2);
        v62 = (void *)objc_claimAutoreleasedReturnValue();

        v63 = objc_alloc(MEMORY[0x1E0CB3498]);
        _UINSLocalizedStringWithDefaultValue(CFSTR("OK"), CFSTR("OK"));
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        v65 = (void *)objc_msgSend(v63, "initWithString:attributes:", v64, v62);

        objc_msgSend(v74, "setAttributedTitle:forState:", v65, 0);
        objc_msgSend(v74, "addTarget:action:forControlEvents:", v2, sel_dismissGestureKeyboardIntroduction_, 64);
        -[UIView size](v2->m_view, "size");
        objc_msgSend(v74, "setSize:", v66 * 0.25, 20.0);
        -[UIView center](v2->m_view, "center");
        v68 = v67;
        -[UIView size](v2->m_view, "size");
        objc_msgSend(v74, "setCenter:", v68, v69 * 7.0 * 0.125);
        -[UIView addSubview:](v2->m_view, "addSubview:", v74);
        v2->m_start = CFAbsoluteTimeGetCurrent();
        -[NSTimer invalidate](v2->m_gestureKeyboardInfoTimer, "invalidate");
        v11 = 1;
        objc_msgSend(MEMORY[0x1E0C99E88], "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", v2, sel_playGestureKeyboardIntroduction_, 0, 1, 0.02);
        v70 = objc_claimAutoreleasedReturnValue();
        m_gestureKeyboardInfoTimer = v2->m_gestureKeyboardInfoTimer;
        v2->m_gestureKeyboardInfoTimer = (NSTimer *)v70;

        v19 = v78;
        goto LABEL_21;
      }
    }
    (*((void (**)(void))v2->m_completionBlock + 2))();
    m_completionBlock = v2->m_completionBlock;
    v2->m_completionBlock = 0;

    v11 = 0;
LABEL_21:

    goto LABEL_22;
  }
  (*((void (**)(void))v2->m_completionBlock + 2))();
  v10 = v2->m_completionBlock;
  v2->m_completionBlock = 0;

  v11 = 0;
LABEL_22:

  return v11;
}

id __64__UIGestureKeyboardIntroduction_showGestureKeyboardIntroduction__block_invoke(uint64_t a1, void *a2, int a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  void *v26;

  v5 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  v6 = a2;
  objc_msgSend(v5, "setState:forKey:", 2, v6);
  objc_msgSend(*(id *)(a1 + 40), "factory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "traitsForKey:onKeyplane:", v6, *(_QWORD *)(a1 + 48));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "geometry");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "displayFrame");
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;

  objc_msgSend(*(id *)(a1 + 40), "resizableSnapshotViewFromRect:afterScreenUpdates:withCapInsets:", 0, v11, v13, v15, v17, 0.0, 0.0, 0.0, 0.0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 56), "window");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "screen");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "scale");
  objc_msgSend(v18, "setContentScaleFactor:");

  v21 = v15 + 8.0;
  if (a3)
    v21 = -(v15 + 8.0);
  v22 = v21 * 0.5;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "center");
  v24 = v22 + v23;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "center");
  objc_msgSend(v18, "setCenter:", v24);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "addSubview:", v18);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setState:forKey:", 4, v6);
  objc_msgSend(*(id *)(a1 + 40), "viewForKey:", v6);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v25, "removeFromSuperview");
  objc_msgSend(v18, "center");
  objc_msgSend(v25, "setCenter:");
  +[UIButton buttonWithType:](UIButton, "buttonWithType:", 1);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "addTarget:action:forControlEvents:", *(_QWORD *)(a1 + 32), sel_tryGestureKeyboardFromView_withEvent_, 4095);
  objc_msgSend(v18, "frame");
  objc_msgSend(v26, "setFrame:");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "addSubview:", v26);

  return v25;
}

- (void)insertText:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;

  v6 = a4;
  v7 = a3;
  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKeyboardLayoutStar createKeyEventForStringAction:forKey:inputFlags:](self->m_layout, "createKeyEventForStringAction:forKey:inputFlags:", v7, v6, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "taskQueue");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __51__UIGestureKeyboardIntroduction_insertText_forKey___block_invoke;
  v13[3] = &unk_1E16BB0D8;
  v14 = v8;
  v15 = v9;
  v11 = v9;
  v12 = v8;
  objc_msgSend(v10, "performSingleTask:", v13);

  ++self->m_insertedTextLength;
}

uint64_t __51__UIGestureKeyboardIntroduction_insertText_forKey___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleKeyEvent:executionContext:", *(_QWORD *)(a1 + 40), a2);
}

- (void)tryGestureKeyboardFromView:(id)a3 withEvent:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  double v9;
  CGFloat v10;
  double v11;
  double v12;
  double y;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  uint64_t v19;
  id v20;
  double v21;
  double v22;
  double v23;
  uint64_t v24;
  id v25;
  double v26;
  void *v27;
  double v28;
  double v29;
  NSTimer *m_gestureKeyboardInfoTimer;
  void *v31;
  void *v32;
  dispatch_time_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  dispatch_time_t v42;
  void *v43;
  void *v44;
  _QWORD v45[4];
  id v46;
  _QWORD block[4];
  id v48;

  v6 = a3;
  objc_msgSend(a4, "touchesForView:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "anyObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "locationInView:", v6);
  v10 = v9;
  v12 = v11;
  y = self->m_initPoint.y;
  objc_msgSend(v6, "size");
  v15 = v14;
  objc_msgSend(v6, "center");
  v17 = v16;
  -[UIView center](self->m_view, "center");
  if (v17 >= v18)
    v19 = 32;
  else
    v19 = 24;
  v20 = *(id *)((char *)&self->super.isa + v19);
  objc_msgSend(v6, "center");
  v22 = v21;
  -[UIView center](self->m_view, "center");
  if (v22 <= v23)
    v24 = 32;
  else
    v24 = 24;
  v25 = *(id *)((char *)&self->super.isa + v24);
  v26 = (v12 - y) / v15;
  switch(objc_msgSend(v8, "phase"))
  {
    case 0:
      -[NSTimer invalidate](self->m_gestureKeyboardInfoTimer, "invalidate");
      m_gestureKeyboardInfoTimer = self->m_gestureKeyboardInfoTimer;
      self->m_gestureKeyboardInfoTimer = 0;

      self->m_initPoint.x = v10;
      self->m_initPoint.y = v12;
      self->m_hasPeeked = 0;
      objc_msgSend(v25, "superview");
      v31 = (void *)objc_claimAutoreleasedReturnValue();

      if (v31)
      {
        -[UIKeyboardLayoutStar keyViewAnimator](self->m_layout, "keyViewAnimator");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "endTransitionForKeyView:", v25);

        v33 = dispatch_time(0, 100000000);
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __70__UIGestureKeyboardIntroduction_tryGestureKeyboardFromView_withEvent___block_invoke;
        block[3] = &unk_1E16B1B28;
        v48 = v25;
        dispatch_after(v33, MEMORY[0x1E0C80D38], block);

      }
      objc_msgSend(v20, "superview");
      v34 = (void *)objc_claimAutoreleasedReturnValue();

      if (v34)
      {
        -[UIKeyboardLayoutStar keyViewAnimator](self->m_layout, "keyViewAnimator");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "endTransitionForKeyView:", v20);

      }
      else
      {
        -[UIView addSubview:](self->m_view, "addSubview:", v20);
      }
      break;
    case 1:
    case 2:
      -[UIKeyboardLayoutStar keyViewAnimator](self->m_layout, "keyViewAnimator");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = v12 - self->m_initPoint.y;
      objc_msgSend(v6, "size");
      objc_msgSend(v27, "updateTransitionForKeyView:normalizedDragSize:", v20, 0.0, v28 / v29);

      if (v26 > 0.5)
        self->m_hasPeeked = 1;
      break;
    case 3:
      if (v26 > 0.5)
      {
        objc_msgSend(v20, "key");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "secondaryRepresentedStrings");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "firstObject");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "key");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "gestureKey");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIGestureKeyboardIntroduction insertText:forKey:](self, "insertText:forKey:", v38, v40);

        goto LABEL_17;
      }
      if (self->m_hasPeeked)
        goto LABEL_20;
      objc_msgSend(v20, "key");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "representedString");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "key");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIGestureKeyboardIntroduction insertText:forKey:](self, "insertText:forKey:", v43, v44);

      goto LABEL_18;
    case 4:
      if (v26 > 0.5)
      {
LABEL_17:
        -[UIKeyboardLayoutStar keyViewAnimator](self->m_layout, "keyViewAnimator");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "endTransitionForKeyView:", v20);
LABEL_18:

      }
LABEL_20:
      v42 = dispatch_time(0, 100000000);
      v45[0] = MEMORY[0x1E0C809B0];
      v45[1] = 3221225472;
      v45[2] = __70__UIGestureKeyboardIntroduction_tryGestureKeyboardFromView_withEvent___block_invoke_2;
      v45[3] = &unk_1E16B1B28;
      v46 = v20;
      dispatch_after(v42, MEMORY[0x1E0C80D38], v45);

      break;
    default:
      break;
  }

}

uint64_t __70__UIGestureKeyboardIntroduction_tryGestureKeyboardFromView_withEvent___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeFromSuperview");
}

uint64_t __70__UIGestureKeyboardIntroduction_tryGestureKeyboardFromView_withEvent___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeFromSuperview");
}

- (void)playGestureKeyboardIntroduction:(id)a3
{
  double v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSTimer *m_gestureKeyboardInfoTimer;
  int v12;
  BOOL v13;
  uint64_t v14;
  double v15;
  void *v16;
  void *v17;
  id v18;

  v4 = CFAbsoluteTimeGetCurrent() - self->m_start;
  if (v4 >= 8.0)
  {
    -[UIView superview](self->m_firstKeyView, "superview");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
      -[UIKBKeyView removeFromSuperview](self->m_firstKeyView, "removeFromSuperview");
    -[UIView superview](self->m_secondKeyView, "superview");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
      -[UIKBKeyView removeFromSuperview](self->m_secondKeyView, "removeFromSuperview");
    -[NSTimer invalidate](self->m_gestureKeyboardInfoTimer, "invalidate");
    m_gestureKeyboardInfoTimer = self->m_gestureKeyboardInfoTimer;
    self->m_gestureKeyboardInfoTimer = 0;

  }
  else
  {
    v5 = floor(v4 * 0.5);
    v6 = v4 - (v5 + v5);
    if (v6 >= 1.3)
    {
      v12 = (int)v4 & 3;
      if ((int)v4 <= 0)
        v12 = -(-(int)v4 & 3);
      v13 = v12 < 2;
      v14 = 32;
      if (v13)
        v14 = 24;
      v18 = *(id *)((char *)&self->super.isa + v14);
      -[UIView addSubview:](self->m_view, "addSubview:");
      v15 = v6 + -1.3;
      if (v15 >= 0.5)
      {
        if (self->m_isInTransition)
        {
          -[UIKeyboardLayoutStar keyViewAnimator](self->m_layout, "keyViewAnimator");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "endTransitionForKeyView:", v18);

          self->m_isInTransition = 0;
        }
      }
      else
      {
        -[UIKeyboardLayoutStar keyViewAnimator](self->m_layout, "keyViewAnimator");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "updateTransitionForKeyView:normalizedDragSize:", v18, 0.0, v15 + v15);

        self->m_isInTransition = 1;
      }

    }
    else
    {
      -[UIView superview](self->m_firstKeyView, "superview");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (v7)
        -[UIKBKeyView removeFromSuperview](self->m_firstKeyView, "removeFromSuperview");
      -[UIView superview](self->m_secondKeyView, "superview");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (v8)
        -[UIKBKeyView removeFromSuperview](self->m_secondKeyView, "removeFromSuperview");
    }
  }
}

- (void)dismissGestureKeyboardIntroduction:(id)a3
{
  NSTimer *m_gestureKeyboardInfoTimer;
  UIKBKeyView *m_firstKeyView;
  UIKBKeyView *m_secondKeyView;
  unint64_t v8;
  void (**m_completionBlock)(id, BOOL);
  id v10;
  id v11;

  -[NSTimer invalidate](self->m_gestureKeyboardInfoTimer, "invalidate");
  m_gestureKeyboardInfoTimer = self->m_gestureKeyboardInfoTimer;
  self->m_gestureKeyboardInfoTimer = 0;

  -[UIKBKeyView removeFromSuperview](self->m_firstKeyView, "removeFromSuperview");
  m_firstKeyView = self->m_firstKeyView;
  self->m_firstKeyView = 0;

  -[UIKBKeyView removeFromSuperview](self->m_secondKeyView, "removeFromSuperview");
  m_secondKeyView = self->m_secondKeyView;
  self->m_secondKeyView = 0;

  -[UIView removeFromSuperview](self->m_view, "removeFromSuperview");
  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setHidden:", 0);
  if (self->m_insertedTextLength)
  {
    v8 = 0;
    do
    {
      objc_msgSend(v11, "deleteFromInput");
      ++v8;
    }
    while (self->m_insertedTextLength > v8);
  }
  m_completionBlock = (void (**)(id, BOOL))self->m_completionBlock;
  if (m_completionBlock)
  {
    m_completionBlock[2](m_completionBlock, a3 != 0);
    v10 = self->m_completionBlock;
    self->m_completionBlock = 0;

  }
}

- (void)dismissGestureKeyboardIntroduction
{
  -[UIGestureKeyboardIntroduction dismissGestureKeyboardIntroduction:](self, "dismissGestureKeyboardIntroduction:", 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->m_gestureKeyboardInfoTimer, 0);
  objc_storeStrong(&self->m_completionBlock, 0);
  objc_storeStrong((id *)&self->m_secondKeyView, 0);
  objc_storeStrong((id *)&self->m_firstKeyView, 0);
  objc_storeStrong((id *)&self->m_view, 0);
  objc_storeStrong((id *)&self->m_layout, 0);
}

@end
